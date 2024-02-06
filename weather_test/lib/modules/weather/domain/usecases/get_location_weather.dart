import '../entities/location_entity.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository_interface.dart';

/// A use case for fetching weather data for a specific location.
///
/// This class provides a method to retrieve weather information including
/// the current
/// weather and the forecast for the next five days for a given city
/// and country.
class GetLocationWeather {
  /// Usage:
  /// ```dart
  /// GetLocationWeather(WeatherRepository())
  /// ```
  const GetLocationWeather(this.weatherRepository);

  /// The repository responsible for retrieving weather data.
  final IWeatherRepository weatherRepository;

  /// Retrieves weather data for a given city and country.
  ///
  /// This method first fetches the geographical position of the specified
  /// city and country.
  /// It then retrieves the current weather conditions and the forecast
  /// for the next five days
  /// for that location.
  ///
  /// - `city`: The name of the city for which to retrieve the weather.
  /// - `country`: The name of the country where the city is located.
  ///
  /// Returns a [Future] that completes with a [LocationEntity] containing
  /// the location details
  /// and associated weather data.
  Future<LocationEntity> call(String city, String country) async {
    final location = await weatherRepository.getPosition(city, country);
    final weathers = <WeatherEntity>[];

    final current = await weatherRepository.getCurrentWeather(location);
    final next5Days = await weatherRepository.getNextFiveDaysWeather(location);
    weathers
      ..add(current)
      ..addAll(next5Days);

    return location.copyWith(
      weathers: weathers,
      country: country,
    );
  }
}
