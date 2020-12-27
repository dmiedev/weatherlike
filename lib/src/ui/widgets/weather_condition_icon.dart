import 'package:flutter/material.dart';
import 'package:weatherlike/src/models/weather.dart';
import 'package:weatherlike/src/ui/constants.dart';

class WeatherConditionIcon extends StatelessWidget {
  final WeatherConditionIconType iconType;

  const WeatherConditionIcon({@required this.iconType})
      : assert(iconType != null);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath(_mapWeatherIconTypeToIconName(iconType)),
      fit: BoxFit.contain,
    );
  }

  String _mapWeatherIconTypeToIconName(WeatherConditionIconType iconType) {
    switch (iconType) {
      case WeatherConditionIconType.clearSky:
        return 'clear-day';
      case WeatherConditionIconType.fewClouds:
      case WeatherConditionIconType.scatteredClouds:
        return 'cloudy-day';
      case WeatherConditionIconType.brokenClouds:
        return 'cloudy';
      case WeatherConditionIconType.showerRain:
        return 'shower-day';
      case WeatherConditionIconType.rain:
        return 'rain';
      case WeatherConditionIconType.thunderstorm:
        return 'thunder-cloud';
      case WeatherConditionIconType.snow:
        return 'snow-cloud';
      case WeatherConditionIconType.mist:
        return 'mist';
      case WeatherConditionIconType.unknown:
      default:
        return 'warning';
    }
  }
}
