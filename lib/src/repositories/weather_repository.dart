import 'dart:async';

import 'package:meta/meta.dart';
import 'package:weatherlike/src/models/models.dart';

import 'package:weatherlike/src/repositories/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Map<String, dynamic>> getWeatherAndLocation(
    String city,
  ) async {
    final location = await weatherApiClient.fetchLocationByCityName(city);
    return {
      'weather': await getWeatherByLocation(location),
      'location': location,
    };
  }

  Future<Weather> getWeatherByLocation(
    Location location,
  ) async {
    return await weatherApiClient.fetchWeatherByLocation(
      location.latitude,
      location.longitude,
    );
  }
}
