import 'package:http/http.dart' as http;

import '../models/models.dart';
import '../utilities/utilities.dart';

class WeatherApiClient {
  WeatherApiClient({
    http.Client httpClient,
  })  : assert(httpClient != null),
        _networkHelper =
            NetworkHelper(httpClient, _authority, {'appid': _apiKey});

  static const _authority = 'api.openweathermap.org';
  static const _apiKey = '29d7a04de099306daa7ee8cb4c92150a';

  final NetworkHelper _networkHelper;

  Future<Location> fetchLocationByCityName(String cityName) async {
    final List data = await _networkHelper.getData(
      '/geo/1.0/direct',
      {'q': cityName, 'limit': '1'},
    );
    return Location.fromJson(data.first);
  }

  Future<Location> fetchLocationByCoordinates(
    double latitude,
    double longitude,
  ) async {
    final List data = await _networkHelper.getData(
      '/geo/1.0/reverse',
      {'lat': '$latitude', 'lon': '$longitude', 'limit': '1'},
    );
    return Location.fromJson(data.first);
  }

  Future<Weather> fetchWeatherByLocation(
    double latitude,
    double longitude,
    MeasurementUnits units,
  ) async {
    final data = await _networkHelper.getData(
      '/data/2.5/onecall',
      {
        'lat': '$latitude',
        'lon': '$longitude',
        'exclude': 'minutely',
        'units': units.toString().split('.').last,
      },
    );
    return Weather.fromJson(data);
  }

  void close() => _networkHelper.close();
}
