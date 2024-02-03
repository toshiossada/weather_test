import '../../../core/http_adapter/http_client_adapter.dart';
import '../repositories/datasources/weather_datasource_interface.dart';
import '../repositories/models/location_model.dart';
import '../repositories/models/weather_model.dart';

class WeatherDatasource implements IWeatherDatasource {
  final IHttpClientAdapter client;
  final apiKey = '441a3d690588c5e9057e0a640bdafb87';
  WeatherDatasource({
    required this.client,
  });

  @override
  Future<LocationModel> getPosition(String city, String state) async {
    final request = await client.get(
      'api.openweathermap.org/data/2.5/weather?q=$city,$state&APPID=$apiKey',
    );

    return LocationModel.fromMap(request.data);
  }

  @override
  Future<WeatherModel> getCurrentWeather(LocationModel location) async {
    final request = await client.get(
      'https://api.openweathermap.org/data/2.5/weather?lon=${location.longitude}&lat=${location.latitude}&appid=$apiKey',
    );

    return WeatherModel.fromMap(request.data);
  }

  @override
  Future<List<WeatherModel>> getNesxtFiveDaysWeather(
    LocationModel location,
  ) async {
    final request = await client.get(
      'https://api.openweathermap.org/data/2.5/weather?lon=${location.longitude}&lat=${location.latitude}&appid=$apiKey',
    );

    return request.data['list'].map((e) => WeatherModel.fromMap(e)).toList();
  }
}
