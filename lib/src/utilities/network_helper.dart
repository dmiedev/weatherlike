import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  const NetworkHelper(
    this.httpClient,
    this.authority, [
    this.defaultParameters,
  ]);

  final http.Client httpClient;
  final String authority;
  final Map<String, String> defaultParameters;

  void close() => httpClient.close();

  Future<dynamic> getData(
    String path, [
    Map<String, String> parameters,
  ]) async {
    final response = await httpClient.get(
      Uri.https(authority, path, {...?parameters, ...?defaultParameters}),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List && data.isEmpty) {
        throw EmptyResponseException('Empty response!');
      }
      return data;
    } else {
      throw BadResponseException(
        'Failed to load data with a response: ${response.body}',
      );
    }
  }
}

class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);
}

class EmptyResponseException extends NetworkException {
  EmptyResponseException(String message) : super(message);
}

class BadResponseException extends NetworkException {
  BadResponseException(String message) : super(message);
}
