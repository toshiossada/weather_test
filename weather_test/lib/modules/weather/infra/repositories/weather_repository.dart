import '../../../core/base_mapper.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/weather_repository_interface.dart';
import 'datasources/weather_datasource_interface.dart';
import 'models/location_model.dart';
import 'models/weather_model.dart';

/// This class uses a weather data source and mappers to fetch and
/// convert weather-related
/// data from a remote source into entities used within the application.
class WeatherRepository implements IWeatherRepository {
  /// Usage:
  /// ```dart
  /// WeatherRepository(
  ///   dataSource: WeatherDataSource(),
  ///   locationMapper: LocationMapper(),
  ///   weatherMapper: WeatherMapper(),
  /// )
  /// ```
  const WeatherRepository({
    required this.dataSource,
    required this.locationMapper,
    required this.weatherMapper,
  });

  /// The data source from which weather data is retrieved.
  final IWeatherDatasource dataSource;

  /// The mapper that converts between [LocationModel] and [LocationEntity].
  final BaseMapper<LocationEntity, LocationModel> locationMapper;

  /// The mapper that converts between [WeatherModel] and [WeatherEntity].
  final BaseMapper<WeatherEntity, WeatherModel> weatherMapper;

  @override
  Future<LocationEntity> getPosition(String city, String country) async {
    final result = await dataSource.getPosition(city, country);

    return locationMapper.toEntity(result);
  }

  @override
  Future<WeatherEntity> getCurrentWeather(LocationEntity location) async {
    final locationModel = locationMapper.toModel(location);
    final result = await dataSource.getCurrentWeather(locationModel);

    return weatherMapper.toEntity(result);
  }

  @override
  Future<List<WeatherEntity>> getNextFiveDaysWeather(
    LocationEntity location,
  ) async {
    final locationModel = locationMapper.toModel(location);
    final result = await dataSource.getNextFiveDaysWeather(locationModel);

    return result.map(weatherMapper.toEntity).toList();
  }
}
