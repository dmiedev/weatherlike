import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherlike/src/blocs/blocs.dart';
import 'package:weatherlike/src/repositories/repositories.dart';
import 'package:weatherlike/src/ui/pages/home.dart';
import 'package:weatherlike/src/ui/pages/select_city.dart';
import 'package:weatherlike/src/ui/pages/week_forecast.dart';

class WeatherLikeApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  WeatherLikeApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherLike',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xFF427bff),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => BlocProvider<WeatherBloc>(
              create: (_) => WeatherBloc(weatherRepository: weatherRepository),
              child: HomePage(),
            ),
        WeekForecastPage.routeName: (context) => WeekForecastPage(),
        SelectCityPage.routeName: (context) => SelectCityPage(),
      },
    );
  }
}
