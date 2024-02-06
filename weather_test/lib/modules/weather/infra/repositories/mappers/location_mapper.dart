import '../../../../core/base_mapper.dart';
import '../../../domain/entities/location_entity.dart';
import '../models/location_model.dart';

/// A final class that extends [BaseMapper] to provide mapping
/// between [LocationEntity]
/// and [LocationModel].
///
/// This mapper is responsible for converting [LocationModel]
/// instances to [LocationEntity]
/// instances and vice versa, enabling the separation of domain and
/// presentation layers.

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
