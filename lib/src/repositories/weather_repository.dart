import 'dart:async';

import 'package:meta/meta.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/repositories/repositories.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Location> getLocationByCityName(String cityName) async {
    final location = await weatherApiClient.fetchLocationByCityName(cityName);
    return location;
  }

  Future<Weather> getWeatherByLocation(
    Location location,
    MeasurementUnits units,
  ) async {
    return await weatherApiClient.fetchWeatherByLocation(
      location.latitude,
      location.longitude,
      units,
    );
  }

  void close() => weatherApiClient.close();
}
