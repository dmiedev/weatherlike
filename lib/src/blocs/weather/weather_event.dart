part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({@required this.location}) : assert(location != null);

  final Location location;

  @override
  List<Object> get props => [location];
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested({@required this.location})
      : assert(location != null);

  final Location location;

  @override
  List<Object> get props => [location];
}
