import '../models/location_model.dart';
import '../models/weather_model.dart';

abstract interface class IWeatherDatasource {
  Future<LocationModel> getPosition(String city, String country);
  Future<WeatherModel> getCurrentWeather(LocationModel location);
  Future<List<WeatherModel>> getNextFiveDaysWeather(LocationModel location);
}
