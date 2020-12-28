import 'package:flutter/material.dart';
import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/ui/widgets/weather_condition_icon.dart';

class WeatherLine extends StatelessWidget {
  final WeatherConditionIconType iconType;
  final String weekDay;
  final String date;
  final int maxTemp;
  final int minTemp;

  const WeatherLine({
    @required this.iconType,
    @required this.weekDay,
    @required this.date,
    @required this.maxTemp,
    @required this.minTemp,
  })  : assert(iconType != null),
        assert(weekDay != null),
        assert(date != null),
        assert(maxTemp != null),
        assert(minTemp != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              WeatherConditionIcon(iconType: iconType),
              SizedBox(width: 40.0),
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
