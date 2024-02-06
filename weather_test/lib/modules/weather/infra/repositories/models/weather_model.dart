import '../../../../core/helpers/helpers.dart';

class WeatherModel {
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
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final String description;
  final String main;
  final DateTime dateTime;
}
