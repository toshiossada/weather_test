import '../../../core/http_adapter/http_client_adapter.dart';
import '../repositories/datasources/weather_datasource_interface.dart';
import '../repositories/models/location_model.dart';
import '../repositories/models/weather_model.dart';

class WeatherDataSource implements IWeatherDataSource {
  final IHttpClientAdapter client;

  WeatherDataSource({
    required this.client,
  });

  @override
  Future<LocationModel> getPosition(String city, String state) async {
    final request = await client.get(
      'api.openweathermap.org/data/2.5/weather?q=$city,$state&APPID=441a3d690588c5e9057e0a640bdafb87',
    );

    return LocationModel.fromMap(request.data);
  }

  @override
  Future<WeatherModel> getCurrentWeather(LocationModel location) async {
    final request = await client.get(
      'https://api.openweathermap.org/data/2.5/weather?lon=-46.6361&lat=-23.5475&appid=441a3d690588c5e9057e0a640bdafb87',
    );

    return WeatherModel.fromMap(request.data);
  }

  @override
  Future<List<WeatherModel>> getNesxtFiveDaysWeather(
      LocationModel location) async {
    final request = await client.get(
      'https://api.openweathermap.org/data/2.5/weather?lon=-46.6361&lat=-23.5475&appid=441a3d690588c5e9057e0a640bdafb87',
    );

    return request.data['list'].map((e) => WeatherModel.fromMap(e)).toList();
  }
}
