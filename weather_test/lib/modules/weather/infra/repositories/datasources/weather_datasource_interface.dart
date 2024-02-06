import '../models/location_model.dart';
import '../models/weather_model.dart';

/// An abstract interface that defines the contract for a weather data source.
///
/// The [IWeatherDatasource] interface specifies methods for fetching
/// weather-related
/// data, such as obtaining the geographical position of a location,
/// and retrieving
/// current weather conditions and forecasts.
abstract interface class IWeatherDatasource {
  /// Fetches the geographical position for a specified city and country.
  ///
  /// This method should return a [Future] that completes with
  /// a [LocationModel],
  /// which contains details such as coordinates and other relevant
  /// location information.
  ///
  /// - `city`: The name of the city for which to retrieve the position.
  /// - `country`: The name of the country where the city is located.
  Future<LocationModel> getPosition(String city, String country);

  /// Retrieves the current weather conditions for a specified location.
  ///
  /// This method should return a [Future] that completes with a [WeatherModel],
  /// which contains the current weather data for the location
  /// represented by the
  /// provided [LocationModel].
  ///
  /// - `location`: A [LocationModel] representing the location
  /// for which to retrieve
  ///   the current weather conditions.
  Future<WeatherModel> getCurrentWeather(LocationModel location);

  /// Retrieves the weather forecast for the next five days for a
  /// specified location.
  ///
  /// This method should return a [Future] that completes with a
  /// list of [WeatherModel]
  /// objects, each representing the weather conditions for one of the
  /// next five days.
  ///
  /// - `location`: A [LocationModel] representing the location for which
  /// to retrieve
  ///   the five-day weather forecast.
  Future<List<WeatherModel>> getNextFiveDaysWeather(LocationModel location);
}
