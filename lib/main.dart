import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:weatherlike/src/app.dart';
import 'package:weatherlike/src/repositories/repositories.dart';
import 'package:weatherlike/src/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(
    WeatherLikeApp(weatherRepository: weatherRepository),
  );
}
