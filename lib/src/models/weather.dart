import 'package:equatable/equatable.dart';

import 'package:weatherlike/src/utilities/utilities.dart';

enum WeatherConditionIconType {
  unknown,
  clearSky,
  fewClouds,
  scatteredClouds,
  brokenClouds,
  showerRain,
  rain,
  thunderstorm,
  snow,
  mist,
}

class Weather extends Equatable {
  final DateTime currentDateTime;
  final DateTime sunrise;
  final DateTime sunset;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double uvIndex;
  final double windSpeed;
  final String description;
  final WeatherConditionIconType icon;
  final List<HourlyWeather> hourly;

  const Weather({
    this.currentDateTime,
    this.sunrise,
    this.sunset,
    this.temperature,
    this.feelsLike,
    this.humidity,
    this.uvIndex,
    this.windSpeed,
    this.description,
    this.icon,
    this.hourly,
  });

  @override
  List<Object> get props => [
        currentDateTime,
        sunrise,
        sunset,
        temperature,
        feelsLike,
        humidity,
        uvIndex,
        windSpeed,
        description,
        icon,
        hourly,
      ];

  static Weather fromJson(Map<String, dynamic> json) {
    final currentWeather = json['current'];
    return Weather(
      currentDateTime: DateTime.now(),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        currentWeather['sunrise'] * 1000,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(
        currentWeather['sunset'] * 1000,
      ),
      temperature: currentWeather['temp'] is int
          ? currentWeather['temp'].toDouble()
          : currentWeather['temp'],
      feelsLike: currentWeather['feels_like'] is int
          ? currentWeather['feels_like'].toDouble()
          : currentWeather['feels_like'],
      humidity: currentWeather['humidity'] is int
          ? currentWeather['humidity'].toDouble()
          : currentWeather['humidity'],
      uvIndex: currentWeather['uvi'] is int
          ? currentWeather['uvi'].toDouble()
          : currentWeather['uvi'],
      windSpeed: currentWeather['wind_speed'] is int
          ? currentWeather['wind_speed'].toDouble()
          : currentWeather['wind_speed'],
      description:
          (currentWeather['weather'][0]['description'] as String).capitalize(),
      icon: mapWeatherIconCodeToWeatherIcon(
        currentWeather['weather'][0]['icon'],
      ),
      hourly: List<HourlyWeather>.generate(
        json['hourly'].length,
        (index) => HourlyWeather.fromJson(json['hourly'][index]),
      ),
    );
  }

  static WeatherConditionIconType mapWeatherIconCodeToWeatherIcon(
    String iconCode,
  ) {
    final code = iconCode.substring(0, 2);
    switch (code) {
      case '01':
        return WeatherConditionIconType.clearSky;
      case '02':
        return WeatherConditionIconType.fewClouds;
      case '03':
        return WeatherConditionIconType.scatteredClouds;
      case '04':
        return WeatherConditionIconType.brokenClouds;
      case '09':
        return WeatherConditionIconType.showerRain;
      case '10':
        return WeatherConditionIconType.rain;
      case '11':
        return WeatherConditionIconType.thunderstorm;
      case '13':
        return WeatherConditionIconType.snow;
      case '50':
        return WeatherConditionIconType.mist;
      default:
        return WeatherConditionIconType.unknown;
    }
  }
}

class HourlyWeather extends Equatable {
  final DateTime dateTime;
  final double temperature;
  final WeatherConditionIconType icon;

  const HourlyWeather({this.dateTime, this.temperature, this.icon});

  @override
  List<Object> get props => [dateTime, temperature, icon];

  static HourlyWeather fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: json['temp'] is int ? json['temp'].toDouble() : json['temp'],
      icon: Weather.mapWeatherIconCodeToWeatherIcon(json['weather'][0]['icon']),
    );
  }
}
