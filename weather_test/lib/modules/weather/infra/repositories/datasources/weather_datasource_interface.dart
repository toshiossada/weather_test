
import '../models/location_model.dart';
import '../models/weather_model.dart';

abstract interface class IWeatherDataSource {
  Future<LocationModel> getPosition(String city, String state);
  Future<WeatherModel> getCurrentWeather(LocationModel location);
  Future<List<WeatherModel>> getNesxtFiveDaysWeather(LocationModel location);
}
