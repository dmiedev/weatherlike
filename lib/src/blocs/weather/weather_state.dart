part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final Location location;

  const WeatherLoadSuccess({
    @required this.weather,
    @required this.location,
  })  : assert(weather != null),
        assert(location != null);

  @override
  List<Object> get props => [weather, location];
}

class WeatherLoadFailure extends WeatherState {}
