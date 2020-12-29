part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoadInProgress extends LocationState {}

class LocationLoadSuccess extends LocationState {
  final Location location;

  const LocationLoadSuccess({@required this.location})
      : assert(location != null);

  @override
  List<Object> get props => [location];
}

class LocationLoadFailure extends LocationState {}
