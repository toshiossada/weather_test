import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/weather/domain/entities/location_entity.dart';
import 'package:weather_test/modules/weather/domain/entities/weather_entity.dart';

void main() {
  test(
      'Given a LocationEntity '
      'Whend has 4 weathers of 30/10/2021 '
      'AND 1 weather of 31/10/2021 '
      'Then should group by date', () async {
    final location = LocationEntity(
      id: 1,
      name: 'São Paulo',
      country: 'BR',
      latitude: -23.5489,
      longitude: -46.6388,
      weathers: [
        WeatherEntity(
          temp: 10,
          feelsLike: 12,
          tempMin: 13,
          tempMax: 13,
          humidity: 13,
          description: 'Testing',
          dateTime: DateTime(2021, 10, 30, 12, 31, 15),
          main: 'Rain',
        ),
        WeatherEntity(
          temp: 10,
          feelsLike: 12,
          tempMin: 13,
          tempMax: 13,
          humidity: 13,
          description: 'Testing',
          dateTime: DateTime(2021, 10, 30, 14, 31, 15),
          main: 'Sun',
        ),
        WeatherEntity(
          temp: 10,
          feelsLike: 12,
          tempMin: 13,
          tempMax: 13,
          humidity: 13,
          description: 'Testing',
          dateTime: DateTime(2021, 10, 30, 17, 31, 15),
          main: 'Snow',
        ),
        WeatherEntity(
          temp: 10,
          feelsLike: 12,
          tempMin: 13,
          tempMax: 13,
          humidity: 13,
          description: 'Testing',
          dateTime: DateTime(2021, 10, 30, 20, 31, 15),
          main: 'Clouds',
        ),
        WeatherEntity(
          temp: 10,
          feelsLike: 12,
          tempMin: 13,
          tempMax: 13,
          humidity: 13,
          description: 'Testing',
          dateTime: DateTime(2021, 10, 31, 20, 31, 15),
          main: 'Clouds',
        ),
      ],
    );
    expect(
      location.weathers.keys.toList().toString(),
      '[30/10/2021, 31/10/2021]',
    );
    expect(location.weathers['30/10/2021']?.length, 4);
    expect(location.weathers['31/10/2021']?.length, 1);
  });

  test(
      'Given a LocationEntity '
      'Whend copyWith to new values '
      'Then return a new instance with new values', () async {
    const location = LocationEntity(
      id: 1,
      name: 'São Paulo',
      country: 'BR',
      latitude: -23.5489,
      longitude: -46.6388,
    );
    var newLocation = location.copyWith();
    expect(
      location.hashCode != newLocation.hashCode,
      isTrue,
    );
    newLocation = location.copyWith(
      id: 2,
      name: 'Londres',
      country: 'Uk',
      latitude: -1,
      longitude: -1,
      weathers: [
        WeatherEntity(
          temp: 10,
          feelsLike: 12,
          tempMin: 13,
          tempMax: 13,
          humidity: 13,
          description: 'Testing',
          dateTime: DateTime(2021, 10, 31, 20, 31, 15),
          main: 'Clouds',
        ),
      ],
    );
    expect(
      location.hashCode != newLocation.hashCode,
      isTrue,
    );

    expect(newLocation.id, 2);
    expect(newLocation.name, 'Londres');
    expect(newLocation.country, 'Uk');
    expect(newLocation.latitude, -1);
    expect(newLocation.longitude, -1);
    expect(newLocation.weathers.length, 1);
  });
}
