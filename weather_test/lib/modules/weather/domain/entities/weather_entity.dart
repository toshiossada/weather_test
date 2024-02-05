import 'package:intl/intl.dart';

import '../enums/weather_enum.dart';

class WeatherEntity {

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
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final String description;
  final DateTime dateTime;
  final String _main;

  String get date {
    final df = DateFormat('dd/MM/yyyy');

    return df.format(dateTime);
  }

  String get time {
    final df = DateFormat('hh:mm');

    return df.format(dateTime);
  }

  WeatherEnum get main => WeatherEnum.fromString(_main);
}
