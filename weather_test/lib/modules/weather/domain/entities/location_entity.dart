import 'package:collection/collection.dart';

import 'weather_entity.dart';

class LocationEntity {
  final String name;
  final String country;
  final double latitude;
  final double longitude;
  final List<WeatherEntity> _weathers;

  LocationEntity({
    this.name = '',
    this.latitude = 0,
    this.longitude = 0,
    this.country = '',
    List<WeatherEntity> weathers = const [],
  }) : _weathers = weathers;

  LocationEntity copyWith({
    String? name,
    String? country,
    double? latitude,
    double? longitude,
    List<WeatherEntity>? weathers,
  }) {
    return LocationEntity(
      name: name ?? this.name,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      weathers: weathers ?? _weathers,
    );
  }

  Map<int, List<WeatherEntity>> get weathers =>
      _weathers.groupListsBy((element) => element.dateTime.day);
}
