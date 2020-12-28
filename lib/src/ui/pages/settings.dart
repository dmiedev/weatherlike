import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherlike/src/blocs/blocs.dart';
import 'package:weatherlike/src/models/measurement_units.dart';
import 'package:weatherlike/src/ui/constants.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        toolbarHeight: 75.0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          iconSize: 30.0,
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(kPagePadding),
            children: [
              Text('Units of measurement'),
              RadioListTile<MeasurementUnits>(
                title: Text('Metric'),
                value: MeasurementUnits.metric,
                groupValue: state.measurementUnits,
                onChanged: (units) =>
                    _onMeasurementUnitsRadioChanged(context, units),
              ),
              RadioListTile<MeasurementUnits>(
                title: Text('Imperial'),
                value: MeasurementUnits.imperial,
                groupValue: state.measurementUnits,
                onChanged: (units) =>
                    _onMeasurementUnitsRadioChanged(context, units),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onMeasurementUnitsRadioChanged(
    BuildContext context,
    MeasurementUnits newUnits,
  ) {
    BlocProvider.of<SettingsBloc>(context).add(
      MeasurementUnitsSelected(measurementUnits: newUnits),
    );
  }
}
