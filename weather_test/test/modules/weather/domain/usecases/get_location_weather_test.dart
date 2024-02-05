import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_test/modules/weather/domain/entities/location_entity.dart';
import 'package:weather_test/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_test/modules/weather/domain/repositories/weather_repository_interface.dart';
import 'package:weather_test/modules/weather/domain/usecases/get_location_weather.dart';

import 'get_location_weather_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IWeatherRepository>()])
void main() {
  late final GetLocationWeather getLocationWeather;
  final repository = MockIWeatherRepository();

  setUpAll(() {
    getLocationWeather = GetLocationWeather(repository);
  });

  test(
      'Given a State and Country '
      'When getLocationWeather is called '
      'Should return a LocationEntity with weathers list with 5 elements.',
      () async {
    const state = 'São Paulo';
    const country = 'Brazil';
    const location = LocationEntity(
      id: 1,
      name: 'São Paulo',
      country: 'Brazil',
      latitude: -23.5489,
      longitude: -46.6388,
      weathers: [],
    );

    when(repository.getPosition(state, country))
        .thenAnswer((_) async => location);
    when(repository.getCurrentWeather(location))
        .thenAnswer((_) async => WeatherEntity(
              temp: 10,
              feelsLike: 12,
              tempMin: 13,
              tempMax: 13,
              humidity: 13,
              description: 'Testing',
              dateTime: DateTime(2021, 10, 30, 12, 31, 15),
              main: 'Rain',
            ));
    when(repository.getNextFiveDaysWeather(location)).thenAnswer((_) async => [
          WeatherEntity(
            temp: 10,
            feelsLike: 12,
            tempMin: 13,
            tempMax: 13,
            humidity: 13,
            description: 'Testing',
            dateTime: DateTime(2021, 10, 31, 13, 30),
            main: 'Sun',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 12,
            tempMin: 13,
            tempMax: 13,
            humidity: 13,
            description: 'Testing',
            dateTime: DateTime(2021, 11, 1, 13, 30),
            main: 'Sun',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 12,
            tempMin: 13,
            tempMax: 13,
            humidity: 13,
            description: 'Testing',
            dateTime: DateTime(2021, 11, 2, 13, 30),
            main: 'Sun',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 12,
            tempMin: 13,
            tempMax: 13,
            humidity: 13,
            description: 'Testing',
            dateTime: DateTime(2021, 11, 3, 13, 30),
            main: 'Sun',
          ),
        ]);

    final result = await getLocationWeather(state, country);

    expect(result.id, location.id);
    expect(result.country, location.country);
    expect(result.latitude, location.latitude);
    expect(result.longitude, location.longitude);
    expect(result.name, location.name);
    expect(result.weathers.length, 5);
  });
}
