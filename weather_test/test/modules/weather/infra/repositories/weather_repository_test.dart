import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_test/modules/weather/domain/entities/location_entity.dart';
import 'package:weather_test/modules/weather/domain/enums/weather_enum.dart';
import 'package:weather_test/modules/weather/domain/repositories/weather_repository_interface.dart';
import 'package:weather_test/modules/weather/infra/repositories/datasources/weather_datasource_interface.dart';
import 'package:weather_test/modules/weather/infra/repositories/mappers/location_mapper.dart';
import 'package:weather_test/modules/weather/infra/repositories/mappers/weather_mapper.dart';
import 'package:weather_test/modules/weather/infra/repositories/models/location_model.dart';
import 'package:weather_test/modules/weather/infra/repositories/models/weather_model.dart';
import 'package:weather_test/modules/weather/infra/repositories/weather_repository.dart';

import 'weather_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IWeatherDatasource>(),
])
void main() {
  late final IWeatherRepository repository;
  final datasource = MockIWeatherDatasource();

  setUpAll(() {
    repository = WeatherRepository(
      dataSource: datasource,
      locationMapper: LocationMapper(),
      weatherMapper: WeatherMapper(),
    );
  });

  test(
      'Given request to getPosition '
      'When datasouce request is sucess '
      'Then should return a LocationEntity with same values of LocationModel',
      () async {
    const model = LocationModel(
      id: 1,
      name: 'São Paulo',
      latitude: -23.5489,
      longitude: -46.6388,
    );

    when(
      datasource.getPosition(
        'São Paulo',
        'Brazil',
      ),
    ).thenAnswer((_) async => model);

    final result = await repository.getPosition('São Paulo', 'Brazil');

    expect(result.id, model.id);
    expect(result.name, model.name);
    expect(result.latitude, model.latitude);
    expect(result.longitude, model.longitude);
  });

  test(
      'Given request to getCurrentWeather '
      'When datasouce request is sucess '
      'Then should return a WeatherEntity with same values of WeatherModel',
      () async {
    const model = LocationEntity(
      id: 1,
      name: 'São Paulo',
      latitude: -23.5489,
      longitude: -46.6388,
    );
    final weatherModel = WeatherModel(
      temp: 10,
      main: 'sun',
      feelsLike: 10,
      tempMin: 10,
      tempMax: 10,
      humidity: 10,
      description: 'Test',
      dateTime: DateTime(2020, 10, 20, 13, 45, 10),
    );

    when(
      datasource.getCurrentWeather(any),
    ).thenAnswer((_) async => weatherModel);

    final result = await repository.getCurrentWeather(model);

    expect(result.temp, 10);
    expect(result.main, WeatherEnum.sun);
    expect(result.feelsLike, 10);
    expect(result.tempMin, 10);
    expect(result.tempMax, 10);
    expect(result.humidity, 10);
    expect(result.description, 'Test');
    expect(result.dateTime, DateTime(2020, 10, 20, 13, 45, 10));
    expect(result.time, '01:45');
    expect(result.date, '20/10/2020');
  });

  test(
      'Given request to getNextFiveDaysWeather '
      'When datasouce request is sucess '
      'Then should return a WeatherEntity with same values of WeatherModel',
      () async {
    const model = LocationEntity(
      id: 1,
      name: 'São Paulo',
      latitude: -23.5489,
      longitude: -46.6388,
    );
    final weatherModel = [
      WeatherModel(
        temp: 10,
        main: 'sun',
        feelsLike: 10,
        tempMin: 10,
        tempMax: 10,
        humidity: 10,
        description: 'Test',
        dateTime: DateTime(2020, 10, 20, 13, 45, 10),
      ),
      WeatherModel(
        temp: 10,
        main: 'sun',
        feelsLike: 10,
        tempMin: 10,
        tempMax: 10,
        humidity: 10,
        description: 'Test',
        dateTime: DateTime(2020, 10, 20, 17),
      ),
      WeatherModel(
        temp: 10,
        main: 'sun',
        feelsLike: 10,
        tempMin: 10,
        tempMax: 10,
        humidity: 10,
        description: 'Test',
        dateTime: DateTime(2020, 10, 21, 13, 45, 10),
      ),
      WeatherModel(
        temp: 10,
        main: 'sun',
        feelsLike: 10,
        tempMin: 10,
        tempMax: 10,
        humidity: 10,
        description: 'Test',
        dateTime: DateTime(2020, 10, 22, 13, 45, 10),
      ),
      WeatherModel(
        temp: 10,
        main: 'sun',
        feelsLike: 10,
        tempMin: 10,
        tempMax: 10,
        humidity: 10,
        description: 'Test',
        dateTime: DateTime(2020, 10, 23, 13, 45, 10),
      ),
      WeatherModel(
        temp: 10,
        main: 'sun',
        feelsLike: 10,
        tempMin: 10,
        tempMax: 10,
        humidity: 10,
        description: 'Test',
        dateTime: DateTime(2020, 10, 24, 13, 45, 10),
      ),
      WeatherModel(
        temp: 10,
        main: 'sun',
        feelsLike: 10,
        tempMin: 10,
        tempMax: 10,
        humidity: 10,
        description: 'Test',
        dateTime: DateTime(2020, 10, 25, 13, 45, 10),
      ),
    ];

    when(
      datasource.getNextFiveDaysWeather(any),
    ).thenAnswer((_) async => weatherModel);

    final result = await repository.getNextFiveDaysWeather(model);
    expect(result.length, 7);
    expect(result.first.temp, 10);
    expect(result.first.main, WeatherEnum.sun);
    expect(result.first.feelsLike, 10);
    expect(result.first.tempMin, 10);
    expect(result.first.tempMax, 10);
    expect(result.first.humidity, 10);
    expect(result.first.description, 'Test');
    expect(result.first.dateTime, DateTime(2020, 10, 20, 13, 45, 10));
    expect(result.first.time, '01:45');
    expect(result.first.date, '20/10/2020');
  });
}
