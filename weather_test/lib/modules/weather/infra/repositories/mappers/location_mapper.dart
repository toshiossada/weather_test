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
    );
  }

  @override
  LocationModel toModel(LocationEntity entity) {
    return LocationModel(
      name: entity.name,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }
}
