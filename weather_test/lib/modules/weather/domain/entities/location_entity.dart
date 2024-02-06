import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'weather_entity.dart';

/// A data entity representing a location with associated weather information.
///
/// This entity stores details about a geographic location, including its name,
/// coordinates, country, and a list of [WeatherEntity] objects representing the
/// weather conditions at this location.
class LocationEntity {
  /// Usage:
  /// ```dart
  /// LocationEntity(
  ///   id: 1,
  ///   name: 'San Francisco',
  ///   country: 'USA',
  ///   latitude: 37.7749,
  ///   longitude: -122.4194,
  /// );
  /// ```
  const LocationEntity({
    this.id = 0,
    this.name = '',
    this.latitude = 0,
    this.longitude = 0,
    this.country = '',
    List<WeatherEntity> weathers = const [],
  }) : _weathers = weathers;

  /// The unique identifier for the location.
  final int id;

  /// The name of the location.
  final String name;

  /// The country where the location is situated.
  final String country;

  /// The latitude coordinate of the location.
  final double latitude;

  /// The longitude coordinate of the location.
  final double longitude;

  final List<WeatherEntity> _weathers;

  /// Returns a new instance of [LocationEntity] with the updated values.
  LocationEntity copyWith({
    int? id,
    String? name,
    String? country,
    double? latitude,
    double? longitude,
    List<WeatherEntity>? weathers,
  }) {
    return LocationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      weathers: weathers ?? _weathers,
    );
  }

  /// A getter that returns a map of weather entities grouped by their date.
  ///
  /// The weather entities are grouped based on the formatted date string
  /// 'dd/MM/yyyy'. This allows for easy access to weather data for specific dates.
  ///
  /// Returns a [Map] where the key is a date string and the value is a list of
  /// [WeatherEntity] objects that correspond to that date.
  Map<String, List<WeatherEntity>> get weathers =>
      _weathers.groupListsBy((element) {
        final df = DateFormat('dd/MM/yyyy');

        return df.format(element.dateTime);
      });
}
