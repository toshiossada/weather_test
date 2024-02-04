import 'package:flutter/material.dart';

enum WeatherEnum {
  rain(Icons.water_drop),
  snow(Icons.ac_unit),
  clouds(Icons.cloud),
  sun(Icons.sunny);

  const WeatherEnum(this.icon);

  final IconData icon;

  capitilize() {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }

  static WeatherEnum fromString(String value) => switch (value) {
        'Rain' => WeatherEnum.rain,
        'Snow' => WeatherEnum.snow,
        'Clouds' => WeatherEnum.clouds,
        'Sun' => WeatherEnum.sun,
        _ => WeatherEnum.sun
      };
}
