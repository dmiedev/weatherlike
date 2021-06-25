import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../utilities/utilities.dart';

part 'city_selection_event.dart';
part 'city_selection_state.dart';

class CitySelectionBloc extends Bloc<CitySelectionEvent, CitySelectionState> {
  CitySelectionBloc({@required WeatherRepository weatherRepository})
      : assert(weatherRepository != null),
        _weatherRepository = weatherRepository,
        super(CitySelectionInitial());

  final WeatherRepository _weatherRepository;

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
    } on Exception {
      yield CitySelectionFailure(
        failureType: CitySelectionFailureType.noInternet,
        cityName: event.cityName,
      );
    }
  }
}
