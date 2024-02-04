// ignore_for_file: public_member_api_docs, sort_constructors_first

class WeatherModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final String description;
  final String main;
  final DateTime dateTime;

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
    return WeatherModel(
      temp: (map['main']['temp'] * 1.0),
      feelsLike: (map['main']['feels_like'] * 1.0),
      tempMin: (map['main']['temp_min'] * 1.0),
      tempMax: (map['main']['temp_max'] * 1.0),
      humidity: map['main']['humidity'],
      description: map['weather'].first['description'],
      main: map['weather'].first['main'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
    );
  }
}
