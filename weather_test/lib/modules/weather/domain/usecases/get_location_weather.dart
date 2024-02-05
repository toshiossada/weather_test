import '../entities/location_entity.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository_interface.dart';

class GetLocationWeather {

  const GetLocationWeather(this.weatherRepository);
  final IWeatherRepository weatherRepository;

  Future<LocationEntity> call(String city, String country) async {
    final location = await weatherRepository.getPosition(city, country);
    final weathers = <WeatherEntity>[];

    final current = await weatherRepository.getCurrentWeather(location);
    final next5Days = await weatherRepository.getNextFiveDaysWeather(location);
    weathers.add(current);
    weathers.addAll(next5Days);

    return location.copyWith(
      weathers: weathers,
      country: country,
    );
  }
}
