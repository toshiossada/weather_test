import '../entities/location_entity.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository_interface.dart';

class GetLocationWeather {
  final IWeatherRepository weatherRepository;

  GetLocationWeather(this.weatherRepository);

  Future<LocationEntity> call(String city, String state) async {
    final location = await weatherRepository.getPosition(city, state);
    final weathers = <WeatherEntity>[];

    await Future.forEach([
      weatherRepository.getCurrentWeather(location),
      weatherRepository.getNesxtFiveDaysWeather(location)
    ], (element) {
      if (element is List<WeatherEntity>) {
        weathers.addAll(element as List<WeatherEntity>);
      } else if (element is WeatherEntity) {
        weathers.add(element as WeatherEntity);
      }
    });

    return location.copyWith(weathers: weathers);
  }
}
