import 'package:flutter/material.dart';

import 'package:weatherlike/src/pages/home.dart';
import 'package:weatherlike/src/pages/week_forecast.dart';

class WeatherLikeApp extends StatelessWidget {
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
        HomePage.routeName: (context) => HomePage(),
        WeekForecastPage.routeName: (context) => WeekForecastPage(),
      },
    );
  }
}
