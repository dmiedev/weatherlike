import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/models.dart';
import '../constants.dart';
import '../widgets/widgets.dart';

class WeekForecastPage extends StatelessWidget {
  const WeekForecastPage({
    @required this.dailyWeather,
    @required this.location,
  })  : assert(dailyWeather != null),
        assert(location != null);

  final List<DailyWeather> dailyWeather;
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 75.0,
        leading: IconButton(
          iconSize: 30.0,
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              '${location.name},',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ' ${location.country}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white54,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            left: kPagePadding,
            right: kPagePadding,
            bottom: kPagePadding,
          ),
          children: [
            Text(
              'Today & next 7 days',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 20.0),
            for (final day in dailyWeather)
              Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: WeatherLine(
                  date: DateFormat.MMMd().format(day.dateTime),
                  weekDay: DateFormat.EEEE().format(day.dateTime),
                  iconType: day.icon,
                  maxTemp: day.maxTemperature.round(),
                  minTemp: day.minTemperature.round(),
                  description: day.description,
                ),
              )
          ],
        ),
      ),
    );
  }
}
