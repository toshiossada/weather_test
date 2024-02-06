import 'package:intl/intl.dart';

import '../enums/weather_enum.dart';

/// A data entity representing weather conditions at a specific date and time.
///
/// This entity stores various meteorological data points such as temperature,
/// humidity, and a description of the weather conditions.
class WeatherEntity {
  /// Usage:
  /// ```dart
  /// WeatherEntity(
  ///   temp: 10,
  ///   feelsLike: 12,
  ///   tempMin: 13,
  ///   tempMax: 13,
  ///   humidity: 13,
  ///   description: 'Testing',
  ///   dateTime: DateTime(2021, 10, 30, 12, 31, 15),
  ///   main: 'Rain',
  /// )
  /// ```
  const WeatherEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.description,
    required this.dateTime,
    required String main,
  }) : _main = main;

  /// The current temperature.
  final double temp;

  /// The 'feels like' temperature.
  final double feelsLike;

  /// The minimum temperature.
  final double tempMin;

  /// The maximum temperature.
  final double tempMax;

  /// The humidity percentage.
  final int humidity;

  /// A textual description of the weather conditions.
  final String description;

  /// The date and time of the weather data.
  final DateTime dateTime;

  final String _main;

  /// A getter that returns the date of the weather data in 'dd/MM/yyyy'
  String get date {
    final df = DateFormat('dd/MM/yyyy');

    return df.format(dateTime);
  }

  /// A getter that returns the time of the weather data in 'hh:mm' format.
  String get time {
    final df = DateFormat('hh:mm');

    return df.format(dateTime);
  }

  /// A getter that converts the private [_main] weather condition string
  /// to a [WeatherEnum] value.
  ///
  /// Utilizes the [WeatherEnum.fromString] factory constructor to parse the
  /// weather condition string and return the corresponding [WeatherEnum] value.
  WeatherEnum get main => WeatherEnum.fromString(_main);
}
