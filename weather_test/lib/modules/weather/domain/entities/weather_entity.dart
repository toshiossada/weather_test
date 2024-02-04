import 'package:collection/collection.dart';

class WeatherEntity {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final String description;
  final DateTime dateTime;

  WeatherEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.description,
    required this.dateTime,
  });



}
