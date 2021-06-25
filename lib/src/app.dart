import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'repositories/repositories.dart';
import 'ui/pages/location_loading.dart';
import 'ui/pages/pages.dart';

class WeatherLikeApp extends StatelessWidget {
  const WeatherLikeApp({
    Key key,
    @required this.weatherRepository,
  })  : assert(weatherRepository != null),
        super(key: key);

  final WeatherRepository weatherRepository;

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
      initialRoute: LocationLoadingPage.routeName,
      routes: {
        LocationLoadingPage.routeName: (context) {
          return BlocProvider(
            create: (_) => LocationBloc(
              weatherRepository: weatherRepository,
              locationRepository: LocationRepository(),
            )..add(LocationRequested()),
            child: LocationLoadingPage(),
          );
        },
        HomePage.routeName: (context) => HomePage(),
        SelectCityPage.routeName: (context) {
          return BlocProvider(
            create: (_) => CitySelectionBloc(
              weatherRepository: weatherRepository,
            ),
            child: SelectCityPage(),
          );
        },
        SettingsPage.routeName: (context) => SettingsPage(),
      },
    );
  }
}
