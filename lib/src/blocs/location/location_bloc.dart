import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/repositories/repositories.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;

  LocationBloc({
    @required WeatherRepository weatherRepository,
    @required LocationRepository locationRepository,
  })  : assert(weatherRepository != null),
        _weatherRepository = weatherRepository,
        assert(locationRepository != null),
        _locationRepository = locationRepository,
        super(LocationInitial());

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is LocationRequested) {
      yield* _mapLocationRequestedToState(event);
    }
  }

  Stream<LocationState> _mapLocationRequestedToState(
    LocationRequested event,
  ) async* {
    yield LocationLoadInProgress();
    if (await _locationRepository.initialize()) {
      final coordinates =
          await _locationRepository.getCurrentLocationCoordinates();
      final location = await _weatherRepository.getLocationByCoordinates(
        coordinates['latitude'],
        coordinates['longitude'],
      );
      yield LocationLoadSuccess(location: location);
    } else {
      yield LocationLoadFailure();
    }
  }
}
