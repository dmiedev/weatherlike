import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/repositories/repositories.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
    WeatherRequested request,
  ) async* {
    yield WeatherLoadInProgress();
    try {
      final data = await weatherRepository.getWeatherAndLocation(request.city);
      yield WeatherLoadSuccess(
        weather: data['weather'],
        location: data['location'],
      );
    } catch (e, stack) {
      print(e);
      print(stack);
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
    WeatherRefreshRequested request,
  ) async* {
    try {
      final data =
          await weatherRepository.getWeatherByLocation(request.location);
      yield WeatherLoadSuccess(
        weather: data,
        location: request.location,
      );
    } catch (_) {}
  }
}
