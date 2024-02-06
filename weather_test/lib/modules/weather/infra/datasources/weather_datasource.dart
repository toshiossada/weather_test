import '../../../core/adapters/http_adapter/http_client_adapter.dart';
import '../repositories/datasources/weather_datasource_interface.dart';
import '../repositories/models/location_model.dart';
import '../repositories/models/weather_model.dart';

/// A data source for weather-related data that implements
/// the [IWeatherDatasource] interface.
///
/// This class is responsible for interacting with an HTTP client to
/// fetch weather data
/// from a remote server or API. It uses an [IHttpClientAdapter] to
/// abstract the details
/// of network communication.
class WeatherDatasource implements IWeatherDatasource {
  /// Usage:
  /// ```dart
  /// WeatherDatasource(DioAdapter())
  /// ```
  const WeatherDatasource({
    required this.client,
  });

  /// The HTTP client adapter used to make network requests.
  final IHttpClientAdapter client;

  @override
  Future<LocationModel> getPosition(String city, String country) async {
    final request = await client.get(
      '/weather?q=$city,$country',
    );

    return LocationModel.fromMap(request.data);
  }

  @override
  Future<WeatherModel> getCurrentWeather(LocationModel location) async {
    final LocationModel(:latitude, :longitude) = location;

    final request = await client.get(
      '/weather?lon=$longitude&lat=$latitude&units=metric',
    );

    return WeatherModel.fromMap(request.data);
  }

  @override
  Future<List<WeatherModel>> getNextFiveDaysWeather(
    LocationModel location,
  ) async {
    final LocationModel(:latitude, :longitude) = location;

    final request = await client.get(
      '/forecast?lon=$longitude&lat=$latitude&units=metric',
    );

    return (request.data['list'] as List)
        .map((map) => WeatherModel.fromMap(map as Map<String, dynamic>))
        .toList();
  }
}
