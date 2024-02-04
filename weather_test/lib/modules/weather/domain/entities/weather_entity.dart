import '../enums/weather_enum.dart';

class WeatherEntity {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final String description;
  final DateTime dateTime;
  final String _main;
  WeatherEnum get main => WeatherEnum.fromString(_main);

  WeatherEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.description,
    required this.dateTime,
    required String main,
  }) : _main = main;
}
