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
  const CitySelectionFailure({
    @required this.failureType,
    @required this.cityName,
  })  : assert(failureType != null),
        assert(cityName != null);

  final CitySelectionFailureType failureType;
  final String cityName;

  @override
  List<Object> get props => [failureType, cityName];
}

class CitySelectionSuccess extends CitySelectionState {
  const CitySelectionSuccess({@required this.location})
      : assert(location != null);

  final Location location;

  @override
  List<Object> get props => [location];
}
