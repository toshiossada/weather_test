import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/weather/domain/entities/location_entity.dart';
import 'package:weather_test/modules/weather/infra/repositories/mappers/location_mapper.dart';
import 'package:weather_test/modules/weather/infra/repositories/models/location_model.dart';

void main() {
  final mapper = LocationMapper();
  test(
      'Given a location model '
      'When Mapper to Entity '
      'Then should return a Location entity', () async {
    const model = LocationModel(
      id: 1,
      name: 'São Paulo',
      latitude: -23.5489,
      longitude: -46.6388,
    );

    final entity = mapper.toEntity(model);

    expect(entity.id, model.id);
    expect(entity.name, model.name);
    expect(entity.latitude, model.latitude);
    expect(entity.longitude, model.longitude);
  });

  test(
      'Given a location entity '
      'When Mapper to Model '
      'Then should return a Location entity', () async {
    const model = LocationEntity(
      id: 1,
      name: 'São Paulo',
      latitude: -23.5489,
      longitude: -46.6388,
    );

    final entity = mapper.toModel(model);

    expect(model.id, entity.id);
    expect(model.name, entity.name);
    expect(model.latitude, entity.latitude);
    expect(model.longitude, entity.longitude);
  });
}
