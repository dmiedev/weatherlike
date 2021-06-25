import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import 'pages.dart';

class LocationLoadingPage extends StatelessWidget {
  static const routeName = '/loading';

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: _locationBlocListener,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Locating you... 🛰️', style: TextStyle(fontSize: 24.0)),
                SizedBox(height: 50.0),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _locationBlocListener(BuildContext context, LocationState state) {
    if (state is LocationLoadSuccess) {
      BlocProvider.of<WeatherBloc>(context)
          .add(WeatherRequested(location: state.location));
    }
    if (state is LocationLoadSuccess || state is LocationLoadFailure) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }
}
