import '../entities/location_entity.dart';
import '../entities/weather_entity.dart';

/// An abstract class that defines the interface for a weather repository.
///
/// The [IWeatherRepository] interface provides methods to fetch
/// weather-related data,
/// such as current weather conditions and forecasts. It is intended
/// to be implemented
/// by concrete classes that handle data retrieval from weather APIs
/// or other data sources.

abstract interface class IWeatherRepository {
  /// Retrieves the geographical position for a given city and country.
  ///
  /// This method is expected to return a [LocationEntity] that contains the
  /// location details
  /// including coordinates and other relevant information.
  ///
  /// - `city`: The name of the city for which to retrieve the position.
  /// - `country`: The name of the country where the city is located.
  ///
  /// Returns a [Future] that completes with a [LocationEntity] object.
  Future<LocationEntity> getPosition(String city, String country);

  /// Fetches the current weather conditions for a given location.
  ///
  /// This method is expected to return a [WeatherEntity] that contains the
  /// current weather
  /// data for the specified location.
  ///
  /// - `location`: The [LocationEntity] representing the location for which to
  /// retrieve
  ///   the current weather conditions.
  ///
  /// Returns a [Future] that completes with a [WeatherEntity] object.
  Future<WeatherEntity> getCurrentWeather(LocationEntity location);

  /// Retrieves the weather forecast for the next five days for a
  /// given location.
  ///
  /// This method is expected to return a list of [WeatherEntity] objects, each
  /// representing
  /// the weather conditions for one of the next five days.
  ///
  /// - `location`: The [LocationEntity] representing the location for which to
  /// retrieve
  ///   the five-day weather forecast.
  ///
  /// Returns a [Future] that completes with a list of [WeatherEntity] objects.
  Future<List<WeatherEntity>> getNextFiveDaysWeather(LocationEntity location);
}
