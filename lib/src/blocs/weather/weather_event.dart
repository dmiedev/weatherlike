part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequested extends WeatherEvent {
  final String city;

  const WeatherRequested({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class WeatherRefreshRequested extends WeatherEvent {
  final Location location;

  const WeatherRefreshRequested({@required this.location})
      : assert(location != null);

  @override
  List<Object> get props => [location];
}

class WeatherMeasurementUnitsChanged extends WeatherEvent {
  final Location location;

  const WeatherMeasurementUnitsChanged({@required this.location})
      : assert(location != null);

  @override
  List<Object> get props => [location];
}
