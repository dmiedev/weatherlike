import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final http.Client httpClient;
  final String authority;
  final Map<String, String> defaultParameters;

  const NetworkHelper(
    this.httpClient,
    this.authority, [
    this.defaultParameters,
  ]);

  Future<dynamic> getData(
    String path, [
    Map<String, String> parameters,
  ]) async {
    final response = await httpClient.get(
      Uri.https(authority, path, {...?parameters, ...?defaultParameters}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data with a response: ${response.body}');
    }
  }
}
