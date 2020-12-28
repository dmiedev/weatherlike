part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequested extends WeatherEvent {
  final Location location;

  const WeatherRequested({@required this.location}) : assert(location != null);

  @override
  List<Object> get props => [location];
}

class WeatherRefreshRequested extends WeatherEvent {
  final Location location;

  const WeatherRefreshRequested({@required this.location})
      : assert(location != null);

  @override
  List<Object> get props => [location];
}
