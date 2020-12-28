part of 'city_selection_bloc.dart';

enum CitySelectionFailureType { notFound, noInternet }

abstract class CitySelectionState extends Equatable {
  const CitySelectionState();

  @override
  List<Object> get props => [];
}

class CitySelectionInitial extends CitySelectionState {}

class CitySelectionLoading extends CitySelectionState {}

class CitySelectionFailure extends CitySelectionState {
  final CitySelectionFailureType failureType;
  final String cityName;

  const CitySelectionFailure({
    @required this.failureType,
    @required this.cityName,
  })  : assert(failureType != null),
        assert(cityName != null);

  @override
  List<Object> get props => [failureType, cityName];
}

class CitySelectionSuccess extends CitySelectionState {
  final Location location;

  const CitySelectionSuccess({@required this.location})
      : assert(location != null);

  @override
  List<Object> get props => [location];
}
