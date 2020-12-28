part of 'city_selection_bloc.dart';

abstract class CitySelectionEvent extends Equatable {
  const CitySelectionEvent();

  @override
  List<Object> get props => [];
}

class CitySelectionMade extends CitySelectionEvent {
  final String cityName;

  const CitySelectionMade({@required this.cityName}) : assert(cityName != null);

  @override
  List<Object> get props => [cityName];
}
