import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String icon;
  final String weatherDescription;
  final String date;
  final int temperature;
  final WeatherCardSegment segment1;
  final WeatherCardSegment segment2;
  final WeatherCardSegment segment3;
  final WeatherCardSegment segment4;

  WeatherCard({
    @required this.icon,
    @required this.weatherDescription,
    @required this.date,
    @required this.temperature,
    @required this.segment1,
    @required this.segment2,
    @required this.segment3,
    @required this.segment4,
  })  : assert(icon != null),
        assert(weatherDescription != null),
        assert(date != null),
        assert(temperature != null),
        assert(segment1 != null),
        assert(segment2 != null),
        assert(segment3 != null),
        assert(segment4 != null);

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
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Image.asset(
                        icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  '$temperature°',
                  style: TextStyle(
                    fontSize: 80.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
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
                          height: 50,
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
                          height: 50,
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Image.asset(
            icon,
            height: 40.0,
            fit: BoxFit.cover,
          ),
        ),
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
