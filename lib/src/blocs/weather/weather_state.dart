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
  final DateTime loadDateTime;

  const WeatherLoadSuccess({
    @required this.weather,
    @required this.location,
    @required this.loadDateTime,
  })  : assert(weather != null),
        assert(location != null),
        assert(loadDateTime != null);

  WeatherLoadSuccess copyWith({
    Weather weather,
    Location location,
    DateTime loadDateTime,
  }) {
    return WeatherLoadSuccess(
      weather: weather ?? this.weather,
      location: location ?? this.location,
      loadDateTime: loadDateTime ?? this.loadDateTime,
    );
  }

  @override
  List<Object> get props => [weather, location, loadDateTime];
}

class WeatherLoadFailure extends WeatherState {}
