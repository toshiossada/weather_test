import '../../../core/adapters/http_adapter/http_client_adapter.dart';
import '../../../core/consts.dart';
import '../repositories/datasources/weather_datasource_interface.dart';
import '../repositories/models/location_model.dart';
import '../repositories/models/weather_model.dart';

class WeatherDatasource implements IWeatherDatasource {
  final IHttpClientAdapter client;
  final Consts consts;

  WeatherDatasource({
    required this.client,
    required this.consts,
  });

  @override
  Future<LocationModel> getPosition(String city, String country) async {
    final Consts(:apiKey) = consts;

    final request = await client.get(
      '/weather?q=$city,$country&APPID=$apiKey',
    );

    return LocationModel.fromMap(request.data);
  }

  @override
  Future<WeatherModel> getCurrentWeather(LocationModel location) async {
    final LocationModel(:latitude, :longitude) = location;
    final Consts(:apiKey) = consts;

    final request = await client.get(
      '/weather?lon=$longitude&lat=$latitude&appid=$apiKey&units=metric',
    );

    return WeatherModel.fromMap(request.data);
  }

  @override
  Future<List<WeatherModel>> getNextFiveDaysWeather(
    LocationModel location,
  ) async {
    final LocationModel(:latitude, :longitude) = location;
    final Consts(:apiKey) = consts;

    final request = await client.get(
      '/forecast?lon=$longitude&lat=$latitude&appid=$apiKey&units=metric',
    );

    return (request.data['list'] as List)
        .map((e) => WeatherModel.fromMap(e))
        .toList();
  }
}
