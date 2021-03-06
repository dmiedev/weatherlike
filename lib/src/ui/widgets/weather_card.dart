import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'widgets.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    @required this.iconType,
    @required this.weatherDescription,
    @required this.dateTime,
    @required this.sunrise,
    @required this.sunset,
    @required this.date,
    @required this.time,
    @required this.temperature,
    @required this.maxTemperature,
    @required this.minTemperature,
    @required this.segment1,
    @required this.segment2,
    @required this.segment3,
    @required this.segment4,
  })  : assert(iconType != null),
        assert(weatherDescription != null),
        assert(dateTime != null),
        assert(sunrise != null),
        assert(sunset != null),
        assert(date != null),
        assert(time != null),
        assert(temperature != null),
        assert(maxTemperature != null),
        assert(minTemperature != null),
        assert(segment1 != null),
        assert(segment2 != null),
        assert(segment3 != null),
        assert(segment4 != null);

  final WeatherConditionIconType iconType;
  final String weatherDescription;
  final DateTime dateTime;
  final DateTime sunrise;
  final DateTime sunset;
  final String date;
  final String time;
  final String temperature;
  final String maxTemperature;
  final String minTemperature;
  final WeatherCardSegment segment1;
  final WeatherCardSegment segment2;
  final WeatherCardSegment segment3;
  final WeatherCardSegment segment4;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 450.0,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: WeatherConditionIcon(
                        iconType: iconType,
                        sunrise: sunrise,
                        sunset: sunset,
                        dateTime: dateTime,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weatherDescription,
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white54,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: TemperatureBox(
                  currentTemperature: temperature,
                  maxTemperature: maxTemperature,
                  minTemperature: minTemperature,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: [
                    Divider(
                      color: Colors.white54,
                      thickness: 1.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: segment1),
                        Container(
                          height: 50.0,
                          width: 1.0,
                          child: VerticalDivider(
                            color: Colors.white54,
                            thickness: 1.0,
                          ),
                        ),
                        Expanded(child: segment2),
                      ],
                    ),
                    Divider(color: Colors.white54, thickness: 1.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: segment3),
                        Container(
                          height: 50.0,
                          width: 1.0,
                          child: VerticalDivider(
                            color: Colors.white54,
                            thickness: 1.0,
                          ),
                        ),
                        Expanded(child: segment4),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCardSegment extends StatelessWidget {
  final String name;
  final String value;
  final String icon;

  WeatherCardSegment({
    @required this.name,
    @required this.value,
    @required this.icon,
  })  : assert(name != null),
        assert(value != null),
        assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 25.0),
        Container(
          child: Image.asset(
            icon,
            height: 40.0,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(value, style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
