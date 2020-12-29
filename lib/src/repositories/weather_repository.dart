import 'dart:async';

import 'package:meta/meta.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/repositories/repositories.dart';

class WeatherRepository {
  final WeatherApiClient _weatherApiClient;

  WeatherRepository({@required WeatherApiClient weatherApiClient})
      : assert(weatherApiClient != null),
        _weatherApiClient = weatherApiClient;

  Future<Location> getLocationByCityName(String cityName) async {
    return await _weatherApiClient.fetchLocationByCityName(cityName);
  }

  Future<Location> getLocationByCoordinates(
    double latitude,
    double longitude,
  ) async {
    return await _weatherApiClient.fetchLocationByCoordinates(
      latitude,
      longitude,
    );
  }

  Future<Weather> getWeatherByLocation(
    Location location,
    MeasurementUnits units,
  ) async {
    return await _weatherApiClient.fetchWeatherByLocation(
      location.latitude,
      location.longitude,
      units,
    );
  }

  void close() => _weatherApiClient.close();
}
