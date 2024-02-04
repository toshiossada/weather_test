import '../entities/location_entity.dart';
import '../entities/weather_entity.dart';

abstract interface class IWeatherRepository {
  Future<LocationEntity> getPosition(String city, String country);
  Future<WeatherEntity> getCurrentWeather(LocationEntity location);
  Future<List<WeatherEntity>> getNextFiveDaysWeather(LocationEntity location);
}
