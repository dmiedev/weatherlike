import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/repositories/repositories.dart';
import 'package:weatherlike/src/utilities/utilities.dart';

part 'city_selection_event.dart';
part 'city_selection_state.dart';

class CitySelectionBloc extends Bloc<CitySelectionEvent, CitySelectionState> {
  final WeatherRepository _weatherRepository;

  CitySelectionBloc({@required WeatherRepository weatherRepository})
      : assert(weatherRepository != null),
        _weatherRepository = weatherRepository,
        super(CitySelectionInitial());

  @override
  Stream<CitySelectionState> mapEventToState(
    CitySelectionEvent event,
  ) async* {
    if (event is CitySelectionMade) {
      yield* _mapCitySelectionMadeToState(event);
    }
  }

  Stream<CitySelectionState> _mapCitySelectionMadeToState(
    CitySelectionMade event,
  ) async* {
    yield CitySelectionLoading();
    try {
      final location = await _weatherRepository.getLocationByCityName(
        event.cityName,
      );
      yield CitySelectionSuccess(location: location);
    } on EmptyResponseException {
      yield CitySelectionFailure(
        failureType: CitySelectionFailureType.notFound,
        cityName: event.cityName,
      );
    } on BadResponseException {
      yield CitySelectionFailure(
        failureType: CitySelectionFailureType.notFound,
        cityName: event.cityName,
      );
    } catch (e, st) {
      print(e);
      print(st);
      yield CitySelectionFailure(
        failureType: CitySelectionFailureType.noInternet,
        cityName: event.cityName,
      );
    }
  }
}
