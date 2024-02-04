import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'weather_entity.dart';

class LocationEntity {
  final int id;
  final String name;
  final String country;
  final double latitude;
  final double longitude;
  final List<WeatherEntity> _weathers;

  LocationEntity({
    this.id = 0,
    this.name = '',
    this.latitude = 0,
    this.longitude = 0,
    this.country = '',
    List<WeatherEntity> weathers = const [],
  }) : _weathers = weathers;

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

  Map<String, List<WeatherEntity>> get weathers =>
      _weathers.groupListsBy((element) {
        final df = DateFormat('dd/MM/yyyy');

        return df.format(element.dateTime);
      });
}
