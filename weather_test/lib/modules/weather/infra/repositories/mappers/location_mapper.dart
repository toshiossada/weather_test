import 'package:flutter/widgets.dart';

import '../../../../core/base_mapper.dart';
import '../../../domain/entities/location_entity.dart';
import '../models/location_model.dart';

final class LocationMapper extends BaseMapper<LocationEntity, LocationModel> {
  @override
  LocationEntity toEntity(LocationModel model) {
    return LocationEntity(
      name: model.name,
      latitude: model.latitude,
      longitude: model.longitude,
      id: model.id,
    );
  }

  @override
  LocationModel toModel(LocationEntity entity) {
    return LocationModel(
      id: entity.id,
      name: entity.name,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }
}
