import 'package:flutter/material.dart';

class TemperatureBox extends StatelessWidget {
  final String currentTemperature;
  final String maxTemperature;
  final String minTemperature;

  const TemperatureBox({
    @required this.currentTemperature,
    @required this.maxTemperature,
    @required this.minTemperature,
  })  : assert(currentTemperature != null),
        assert(maxTemperature != null),
        assert(minTemperature != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentTemperature,
          style: TextStyle(
            fontSize: 80.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              maxTemperature,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              minTemperature,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
