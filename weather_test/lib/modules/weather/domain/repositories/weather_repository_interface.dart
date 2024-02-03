import '../entities/location_entity.dart';
import '../entities/weather_entity.dart';

abstract interface class IWeatherRepository {
  Future<LocationEntity> getPosition(String city, String state);
  Future<WeatherEntity> getCurrentWeather(LocationEntity location);
  Future<List<WeatherEntity>> getNesxtFiveDaysWeather(LocationEntity location);
}
