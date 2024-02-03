// ignore_for_file: public_member_api_docs, sort_constructors_first

class WeatherModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;

  WeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: (map['temp'] ?? 0) as double,
      feelsLike: (map['feels_like'] ?? 0) as double,
      tempMin: (map['temp_min'] ?? 0) as double,
      tempMax: (map['temp_max'] ?? 0) as double,
      humidity: (map['humidity'] ?? 0) as int,
    );
  }
}
