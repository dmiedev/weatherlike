import 'package:flutter/material.dart';

import 'package:weatherlike/src/models/models.dart';
import 'package:weatherlike/src/ui/constants.dart';

class WeatherConditionIcon extends StatelessWidget {
  final WeatherConditionIconType iconType;
  final DateTime dateTime;
  final DateTime sunrise;
  final DateTime sunset;

  const WeatherConditionIcon({
    @required this.iconType,
    this.dateTime,
    this.sunrise,
    this.sunset,
  }) : assert(iconType != null);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath(_mapWeatherIconTypeToIconName(iconType)),
      fit: BoxFit.contain,
    );
  }

  String get _iconVariant {
    if (dateTime != null && sunrise != null && sunset != null) {
      if (dateTime.isAfter(sunrise) && dateTime.isBefore(sunset)) {
        return '-day';
      }
      return '-night';
    }
    return '-day';
  }

  String _mapWeatherIconTypeToIconName(WeatherConditionIconType iconType) {
    switch (iconType) {
      case WeatherConditionIconType.clearSky:
        return 'clear$_iconVariant';
      case WeatherConditionIconType.fewClouds:
      case WeatherConditionIconType.scatteredClouds:
        return 'cloudy$_iconVariant';
      case WeatherConditionIconType.brokenClouds:
        return 'cloudy';
      case WeatherConditionIconType.showerRain:
        return 'shower$_iconVariant';
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
