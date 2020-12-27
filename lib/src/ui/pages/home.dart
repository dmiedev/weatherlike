import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherlike/src/blocs/blocs.dart';
import 'package:weatherlike/src/ui/constants.dart';
import 'package:weatherlike/src/ui/pages/select_city.dart';
import 'package:weatherlike/src/ui/widgets/top_bar.dart';
import 'package:weatherlike/src/ui/widgets/weather_content.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoadSuccess) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer<void>();
            }
          },
          builder: (context, state) {
            if (state is WeatherLoadSuccess) {
              return RefreshIndicator(
                onRefresh: () => _onWeatherRefresh(context, state),
                child: ListView(
                  padding: const EdgeInsets.all(kPagePadding),
                  children: [
                    TopBar(
                      primaryText: state.location.name,
                      secondaryText: state.location.country,
                      actions: _buildTopBarActions(context),
                    ),
                    SizedBox(height: 10.0),
                    WeatherContent(weather: state.weather),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(kPagePadding),
              child: Column(
                children: [
                  TopBar(
                    primaryText: 'WeatherLike',
                    actions: _buildTopBarActions(context),
                  ),
                  Expanded(child: Center(child: _buildMessage(state))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onWeatherRefresh(
    BuildContext context,
    WeatherLoadSuccess state,
  ) async {
    BlocProvider.of<WeatherBloc>(context).add(
      WeatherRefreshRequested(location: state.location),
    );
    return _refreshCompleter.future;
  }

  Widget _buildMessage(WeatherState state) {
    if (state is WeatherLoadInProgress) return CircularProgressIndicator();
    String message = '';
    if (state is WeatherInitial)
      message = 'Select a city by pressing search button above';
    else if (state is WeatherLoadFailure)
      message = 'An error happened while loading weather data!';
    return Text(
      message,
      style: TextStyle(fontSize: 20.0, color: Colors.black54),
      textAlign: TextAlign.center,
    );
  }

  List<Widget> _buildTopBarActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => _onSelectCityButtonPressed(context),
      ),
    ];
  }

  Future<void> _onSelectCityButtonPressed(BuildContext context) async {
    final city = await Navigator.pushNamed(context, SelectCityPage.routeName);
    if (city != null) {
      BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: city));
    }
  }
}
