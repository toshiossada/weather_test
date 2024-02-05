import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_test/modules/weather/domain/enums/weather_enum.dart';
import 'package:weather_test/modules/weather/infra/repositories/mappers/weather_mapper.dart';
import 'package:weather_test/modules/weather/infra/repositories/models/weather_model.dart';

void main() {
  final mapper = WeatherMapper();
  test(
      'Given a weather model '
      'When Mapper to Entity '
      'Then should return a weather entity', () async {
    final model = WeatherModel(
      temp: 10,
      feelsLike: 10,
      tempMin: 10,
      tempMax: 19,
      humidity: 10,
      description: 'Test',
      dateTime: DateTime.now(),
      main: 'Clouds',
    );

    final entity = mapper.toEntity(model);

    expect(entity.temp, model.temp);
    expect(entity.feelsLike, model.feelsLike);
    expect(entity.tempMin, model.tempMin);
    expect(entity.tempMax, model.tempMax);
    expect(entity.humidity, model.humidity);
    expect(entity.description, model.description);
    expect(entity.dateTime, model.dateTime);
    expect(entity.main.capitalize(), model.main);
  });

  test(
      'Given a weather entity '
      'When Mapper to Model '
      'Then should return a weather entity', () async {
    final model = WeatherEntity(
      temp: 10,
      feelsLike: 10,
      tempMin: 10,
      tempMax: 19,
      humidity: 10,
      description: 'Test',
      dateTime: DateTime.now(),
      main: 'clouds',
    );

    final entity = mapper.toModel(model);

    expect(model.temp, entity.temp);
    expect(model.feelsLike, entity.feelsLike);
    expect(model.tempMin, entity.tempMin);
    expect(model.tempMax, entity.tempMax);
    expect(model.humidity, entity.humidity);
    expect(model.description, entity.description);
    expect(model.dateTime, entity.dateTime);
    expect(model.main, WeatherEnum.fromString(entity.main));
  });
}
