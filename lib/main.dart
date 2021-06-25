import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'src/app.dart';
import 'src/blocs/blocs.dart';
import 'src/repositories/repositories.dart';
import 'src/utilities/utilities.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(httpClient: http.Client()),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(create: (_) => SettingsBloc()),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            settingsBloc: BlocProvider.of<SettingsBloc>(context),
            weatherRepository: weatherRepository,
          ),
        )
      ],
      child: WeatherLikeApp(weatherRepository: weatherRepository),
    ),
  );
}
