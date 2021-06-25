import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'weather_condition_icon.dart';

class WeatherLine extends StatelessWidget {
  const WeatherLine({
    @required this.iconType,
    @required this.weekDay,
    @required this.date,
    @required this.maxTemp,
    @required this.minTemp,
    @required this.description,
  })  : assert(iconType != null),
        assert(weekDay != null),
        assert(date != null),
        assert(maxTemp != null),
        assert(minTemp != null),
        assert(description != null);

  final WeatherConditionIconType iconType;
  final String weekDay;
  final String date;
  final int maxTemp;
  final int minTemp;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherConditionIcon(iconType: iconType),
              SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        '$weekDay, ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white60,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                '$maxTemp°',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                ' / $minTemp°',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
