import 'package:flutter/material.dart';

class WeatherLine extends StatelessWidget {
  final String icon;
  final String weekDay;
  final String date;
  final int dayTemp;
  final int nightTemp;

  WeatherLine({
    @required this.icon,
    @required this.weekDay,
    @required this.date,
    @required this.dayTemp,
    @required this.nightTemp,
  })  : assert(icon != null),
        assert(weekDay != null),
        assert(date != null),
        assert(dayTemp != null),
        assert(nightTemp != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                fit: BoxFit.cover,
              ),
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
                '$dayTemp',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                ' / $nightTemp°',
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
