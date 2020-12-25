import 'package:flutter/material.dart';
import 'package:weatherlike/src/constants.dart';
import 'package:weatherlike/src/pages/week_forecast.dart';
import 'package:weatherlike/src/widgets/weather_card.dart';
import 'package:weatherlike/src/widgets/weather_mini_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(kPagePadding),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    'Saint Petersburg,',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' Russia',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            WeatherCard(
              icon: 'assets/icons/iconfinder_weather_2_2682849.png',
              weatherDescription: 'Heavy Rain',
              date: 'Sunday, 02 Oct',
              temperature: 24,
              segment1: WeatherCardSegment(
                name: 'WIND',
                value: '19.5 m/s',
                icon: 'assets/icons/iconfinder_weather_9_2682842.png',
              ),
              segment2: WeatherCardSegment(
                name: 'FEELS LIKE',
                value: '25°',
                icon: 'assets/icons/iconfinder_weather_43_2682808.png',
              ),
              segment3: WeatherCardSegment(
                name: 'UV INDEX',
                value: '2',
                icon: 'assets/icons/iconfinder_weather_45_2682806.png',
              ),
              segment4: WeatherCardSegment(
                name: 'HUMIDITY',
                value: '23%',
                icon: 'assets/icons/iconfinder_weather_44_2682807.png',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                OutlineButton.icon(
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
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 10; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: WeatherMiniCard(
                        emphasized: i == 0,
                        icon: 'assets/icons/iconfinder_weather_2_2682849.png',
                        lowerLabel: '24°',
                        upperLabel: '12:00',
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
