part of 'city_selection_bloc.dart';

abstract class CitySelectionEvent extends Equatable {
  const CitySelectionEvent();

  @override
  List<Object> get props => [];
}

class CitySelectionMade extends CitySelectionEvent {
  const CitySelectionMade({@required this.cityName}) : assert(cityName != null);

  final String cityName;

  @override
  List<Object> get props => [cityName];
}
