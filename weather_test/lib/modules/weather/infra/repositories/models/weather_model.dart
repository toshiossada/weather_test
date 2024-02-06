import '../../../../core/helpers/helpers.dart';

/// A model representing weather conditions, typically used for data transfer.
///
/// This model contains various attributes related to weather
/// such as temperature,
/// humidity, and a description of the weather conditions.
class WeatherModel {
  /// Usage:
  /// ```dart
  /// WeatherModel(
  ///   temp: 10,
  ///   main: 'sun',
  ///   feelsLike: 10,
  ///   tempMin: 10,
  ///   tempMax: 10,
  ///   humidity: 10,
  ///   description: 'Test',
  ///   dateTime: DateTime(2020, 10, 20, 17),
  /// )
  /// ```
  const WeatherModel({
    required this.temp,
    required this.main,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.description,
    required this.dateTime,
  });

  /// Creates a [WeatherModel] from a [Map] of key-value pairs.
  ///
  /// This factory constructor parses a map (typically from JSON) and
  /// creates a new
  /// [WeatherModel] object. It validates the presence and non-nullity of
  /// required keys
  /// before constructing the object.
  ///
  /// - `map`: A map containing weather-related key-value pairs.
  ///
  /// Throws RequiredKeysError if any required keys are missing.
  /// Throws DisallowedNullValueError if any keys have disallowed null values.
  ///
  /// Returns an instance of [WeatherModel].
  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    DefaultHelpers.checkKeys(
      map,
      requiredKeys: ['main', 'weather', 'dt'],
      disallowNullValues: ['main', 'weather', 'dt'],
      objName: 'WeatherModel',
    );
    DefaultHelpers.checkKeys(
      map['main'],
      objName: 'WeatherModel',
      requiredKeys: [
        'temp',
        'feels_like',
        'temp_min',
        'temp_max',
        'humidity',
      ],
      disallowNullValues: [
        'temp',
        'feels_like',
        'temp_min',
        'temp_max',
        'humidity',
      ],
    );
    DefaultHelpers.checkKeys(
      map['weather'].first,
      requiredKeys: ['description', 'main'],
      disallowNullValues: ['description', 'main'],
      objName: 'WeatherModel',
    );
    return WeatherModel(
      temp: map['main']['temp'] * 1.0,
      feelsLike: map['main']['feels_like'] * 1.0,
      tempMin: map['main']['temp_min'] * 1.0,
      tempMax: map['main']['temp_max'] * 1.0,
      humidity: map['main']['humidity'],
      description: map['weather'].first['description'],
      main: map['weather'].first['main'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
    );
  }

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

  /// The main weather condition.
  final String main;

  /// The date and time of the weather data.
  final DateTime dateTime;
}
