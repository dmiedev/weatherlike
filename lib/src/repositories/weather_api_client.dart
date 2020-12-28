import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/utilities/network_helper.dart';

class WeatherApiClient {
  static const _authority = 'api.openweathermap.org';
  static const _apiKey = '29d7a04de099306daa7ee8cb4c92150a';

  final http.Client httpClient;
  NetworkHelper _networkHelper;

  WeatherApiClient({@required this.httpClient})
      : assert(httpClient != null),
        _networkHelper =
            NetworkHelper(httpClient, _authority, {'appid': _apiKey});

  Future<Location> fetchLocationByCityName(String cityName) async {
    final List data = await _networkHelper.getData(
      '/geo/1.0/direct',
      {'q': cityName, 'limit': '1'},
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
