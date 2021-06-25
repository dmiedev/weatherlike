import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({
    @required WeatherRepository weatherRepository,
    @required LocationRepository locationRepository,
  })  : assert(weatherRepository != null),
        _weatherRepository = weatherRepository,
        assert(locationRepository != null),
        _locationRepository = locationRepository,
        super(LocationInitial());

  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;

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
      try {
        final coordinates =
            await _locationRepository.getCurrentLocationCoordinates();
        final location = await _weatherRepository.getLocationByCoordinates(
          coordinates['latitude'],
          coordinates['longitude'],
        );
        yield LocationLoadSuccess(location: location);
      } on Exception {
        yield LocationLoadFailure();
      }
    } else {
      yield LocationLoadFailure();
    }
  }
}
