import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:weatherlike/src/blocs/blocs.dart';
import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/repositories/repositories.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  final SettingsBloc _settingsBloc;
  StreamSubscription<SettingsState> _settingsSubscription;

  WeatherBloc({
    @required this.weatherRepository,
    @required SettingsBloc settingsBloc,
  })  : assert(weatherRepository != null),
        assert(settingsBloc != null),
        _settingsBloc = settingsBloc,
        super(WeatherInitial()) {
    _settingsSubscription = settingsBloc.listen(_settingsListener);
  }

  @override
  Future<void> close() {
    _settingsSubscription.cancel();
    return super.close();
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
    WeatherRequested event,
  ) async* {
    yield WeatherLoadInProgress();
    try {
      final weather = await weatherRepository.getWeatherByLocation(
        event.location,
        _settingsBloc.state.measurementUnits,
      );
      yield WeatherLoadSuccess(
        weather: weather,
        location: event.location,
      );
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
    WeatherRefreshRequested event,
  ) async* {
    if (state is WeatherLoadSuccess) {
      try {
        final data = await weatherRepository.getWeatherByLocation(
          event.location,
          _settingsBloc.state.measurementUnits,
        );
        yield WeatherLoadSuccess(
          weather: data,
          location: event.location,
        );
      } catch (_) {
        yield state;
      }
    }
  }

  void _settingsListener(SettingsState _) {
    if (state is WeatherLoadSuccess) {
      add(
        WeatherRequested(location: (state as WeatherLoadSuccess).location),
      );
    }
  }
}
