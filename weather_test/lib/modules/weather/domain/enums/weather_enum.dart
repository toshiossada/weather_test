import 'package:flutter/material.dart';

/// An enumeration of weather conditions with associated icons.
///
/// This enum provides a set of predefined weather conditions,
/// each with a corresponding
/// icon from the Material Icons library.
enum WeatherEnum {
  /// Represents rainy weather with a water drop icon.
  rain(Icons.water_drop),

  /// Represents snowy weather with an AC unit (snowflake) icon.
  snow(Icons.ac_unit),

  /// Represents cloudy weather with a cloud icon.
  clouds(Icons.cloud),

  /// Represents sunny weather with a sun icon.
  sun(Icons.sunny);

  const WeatherEnum(this.icon);

  /// The icon associated with the weather condition.
  final IconData icon;

  /// A method that capitalizes the first letter of the weather
  /// condition's name.
  ///
  /// Returns the capitalized name of the weather condition.
  String capitalize() {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }

  /// A factory method that converts a string value to a
  /// corresponding [WeatherEnum] value.
  ///
  /// - `value`: A string representation of the weather condition.
  ///
  /// Returns a [WeatherEnum] value matching the string, or [WeatherEnum.sun]
  /// if no match is found.
  static WeatherEnum fromString(String value) => switch (value.toLowerCase()) {
        'rain' => WeatherEnum.rain,
        'snow' => WeatherEnum.snow,
        'clouds' => WeatherEnum.clouds,
        'sun' => WeatherEnum.sun,
        _ => WeatherEnum.sun
      };
}
