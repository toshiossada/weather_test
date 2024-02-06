import '../../../../core/helpers/helpers.dart';

/// A model representing a geographic location.
///
/// This model contains essential information about a location,
/// including its unique
/// identifier, name, and geographic coordinates.
class LocationModel {
  /// Usage:
  /// ```dart
  /// LocationModel(
  ///   id: 10,
  ///   name: 'São Paulo',
  ///   latitude: 1.54,
  ///   longitude: 1.4,
  /// )
  /// ```
  const LocationModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  /// Creates a [LocationModel] from a [Map] of key-value pairs.
  ///
  /// This factory constructor parses a map (typically from JSON) and
  /// creates a new
  /// [LocationModel] object. It validates the presence and non-nullity
  /// of required keys
  /// before constructing the object.
  ///
  /// - `map`: A map containing location-related key-value pairs.
  ///
  /// Throws RequiredKeysError if any required keys are missing.
  /// Throws DisallowedNullValueError if any keys have disallowed null values.
  ///
  /// Returns an instance of [LocationModel].
  factory LocationModel.fromMap(Map<String, dynamic> map) {
    DefaultHelpers.checkKeys(
      map,
      requiredKeys: ['id', 'name', 'coord'],
      disallowNullValues: ['id', 'name', 'coord'],
      objName: 'LocationModel',
    );
    DefaultHelpers.checkKeys(
      map['coord'],
      requiredKeys: ['lat', 'lon'],
      disallowNullValues: ['lat', 'lon'],
      objName: 'LocationModel',
    );

    return LocationModel(
      id: map['id'],
      name: map['name'],
      latitude: map['coord']['lat'],
      longitude: map['coord']['lon'],
    );
  }

  /// The unique identifier for the location.
  final int id;

  /// The name of the location.
  final String name;

  /// The latitude coordinate of the location.
  final double latitude;

  /// The longitude coordinate of the location.
  final double longitude;
}
