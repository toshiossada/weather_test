import 'weather_entity.dart';

class LocationEntity {
  final String name;
  final double latitude;
  final double longitude;
  final List<WeatherEntity> weathers;

  LocationEntity({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.weathers = const [],
  });

  LocationEntity copyWith({
    String? name,
    double? latitude,
    double? longitude,
    List<WeatherEntity>? weathers,
  }) {
    return LocationEntity(
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      weathers: weathers ?? this.weathers,
    );
  }
}
