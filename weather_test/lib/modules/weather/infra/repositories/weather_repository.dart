import '../../../core/base_mapper.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/weather_repository_interface.dart';
import 'datasources/weather_datasource_interface.dart';
import 'models/location_model.dart';
import 'models/weather_model.dart';

class WeatherRepository implements IWeatherRepository {
  final IWeatherDatasource dataSource;
  final BaseMapper<LocationEntity, LocationModel> locationMapper;
  final BaseMapper<WeatherEntity, WeatherModel> weatherMapper;

  const WeatherRepository({
    required this.dataSource,
    required this.locationMapper,
    required this.weatherMapper,
  });

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
      LocationEntity location) async {
    final locationModel = locationMapper.toModel(location);
    final result = await dataSource.getNextFiveDaysWeather(locationModel);

    return result.map((e) => weatherMapper.toEntity(e)).toList();
  }
}
