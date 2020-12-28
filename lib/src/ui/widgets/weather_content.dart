import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/ui/constants.dart';
import 'package:weatherlike/src/ui/pages/pages.dart';
import 'package:weatherlike/src/ui/widgets/widgets.dart';

class WeatherContent extends StatelessWidget {
  final Weather weather;
  final MeasurementUnits units;

  const WeatherContent({
    @required this.weather,
    @required this.units,
  })  : assert(weather != null),
        assert(units != null);

  String get _thermometerIconName {
    return weather.feelsLike >= (units == MeasurementUnits.metric ? 0 : 32)
        ? 'thermometer-high'
        : 'thermometer-low';
  }

  String get _windMeasurementUnits {
    switch (units) {
      case MeasurementUnits.metric:
        return 'm/s';
      case MeasurementUnits.imperial:
        return 'mi/h';
      default:
        return '?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherCard(
          iconType: weather.icon,
          weatherDescription: weather.description,
          date: DateFormat.MMMEd().format(weather.currentDateTime),
          time: DateFormat.Hm().format(weather.currentDateTime),
          temperature: weather.temperature.toStringAsFixed(1),
          segment1: WeatherCardSegment(
            name: 'WIND',
            value: '${weather.windSpeed} $_windMeasurementUnits',
            icon: iconPath('wind'),
          ),
          segment2: WeatherCardSegment(
            name: 'FEELS LIKE',
            value: '${weather.feelsLike}°',
            icon: iconPath(_thermometerIconName),
          ),
          segment3: WeatherCardSegment(
            name: 'UV INDEX',
            value: '${weather.uvIndex}',
            icon: iconPath('uv'),
          ),
          segment4: WeatherCardSegment(
            name: 'HUMIDITY',
            value: '${weather.humidity}%',
            icon: iconPath('humidity'),
          ),
        ),
        SizedBox(height: 5.0),
        Align(
          alignment: Alignment.centerRight,
          child: OutlineButton.icon(
            icon: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black54,
            ),
            label: Text(
              'Next 7 days',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            onPressed: () =>
                Navigator.pushNamed(context, WeekForecastPage.routeName),
          ),
        ),
        Builder(
          builder: (context) {
            final hourly = _getTodayHourlyWeather();
            if (hourly.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < hourly.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: WeatherMiniCard(
                              emphasized: i == 0,
                              iconType: hourly[i].icon,
                              lowerLabel: '${hourly[i].temperature.toInt()}°',
                              upperLabel: DateFormat.Hm().format(
                                hourly[i].dateTime,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
        SizedBox(height: 20.0),
        Builder(
          builder: (context) {
            final hourly = _getTomorrowHourlyWeather();
            if (hourly.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tomorrow',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < hourly.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: WeatherMiniCard(
                              iconType: hourly[i].icon,
                              lowerLabel: '${hourly[i].temperature.toInt()}°',
                              upperLabel: DateFormat.Hm().format(
                                hourly[i].dateTime,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ],
    );
  }

  List<HourlyWeather> _getTodayHourlyWeather() {
    final index = weather.hourly.indexOf(
      weather.hourly.firstWhere((weather) => weather.dateTime.hour == 0),
    );
    return weather.hourly.sublist(0, index + 1);
  }

  List<HourlyWeather> _getTomorrowHourlyWeather() {
    final index1 = weather.hourly.indexOf(
      weather.hourly.firstWhere((weather) => weather.dateTime.hour == 0),
    );
    final index2 = weather.hourly.indexOf(
      weather.hourly.lastWhere((weather) => weather.dateTime.hour == 0),
    );
    return weather.hourly.sublist(index1 + 1, index2 + 1);
  }
}
