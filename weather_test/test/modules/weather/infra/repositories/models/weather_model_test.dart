import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/core/helpers/helpers_errors.dart';
import 'package:weather_test/modules/weather/infra/repositories/models/weather_model.dart';

void main() {
  testWidgets(
      'Given a map '
      'When all required fields are filled '
      'Then should return a WeatherModel', (tester) async {
    final map = {
      'coord': {
        'lon': -46.6361,
        'lat': -23.5475,
      },
      'weather': [
        {
          'id': 801,
          'main': 'Clouds',
          'description': 'few clouds',
          'icon': '02d',
        }
      ],
      'base': 'stations',
      'main': {
        'temp': 30.25,
        'feels_like': 30.94,
        'temp_min': 28.58,
        'temp_max': 32.27,
        'pressure': 1020,
        'humidity': 47,
      },
      'visibility': 10000,
      'wind': {
        'speed': 4.63,
        'deg': 180,
      },
      'clouds': {
        'all': 20,
      },
      'dt': 1707152855,
      'sys': {
        'type': 2,
        'id': 2082654,
        'country': 'BR',
        'sunrise': 1707122873,
        'sunset': 1707169987,
      },
      'timezone': -10800,
      'id': 3448439,
      'name': 'São Paulo',
      'cod': 200,
    };

    final result = WeatherModel.fromMap(map);

    expect(result.temp, 30.25);
    expect(result.main, 'Clouds');
    expect(result.feelsLike, 30.94);
    expect(result.tempMin, 28.58);
    expect(result.tempMax, 32.27);
    expect(result.humidity, 47);
    expect(result.description, 'few clouds');
    expect(
      result.dateTime,
      DateTime.fromMillisecondsSinceEpoch(1707152855 * 1000),
    );
  });

  testWidgets(
      'Given a map '
      'When missing required fields '
      'Then should throw a RequiredKeysError', (tester) async {
    final map = {
      'weather': [
        {
          'id': 801,
          'main': 'Clouds',
          'icon': '02d',
        }
      ],
      'base': 'stations',
      'main': {
        'temp': 30.25,
        'feels_like': 30.94,
        'temp_min': 28.58,
        'temp_max': 32.27,
        'pressure': 1020,
        'humidity': 47,
      },
      'visibility': 10000,
      'wind': {
        'speed': 4.63,
        'deg': 180,
      },
      'clouds': {
        'all': 20,
      },
      'dt': 1707152855,
      'sys': {
        'type': 2,
        'id': 2082654,
        'country': 'BR',
        'sunrise': 1707122873,
        'sunset': 1707169987,
      },
      'timezone': -10800,
      'id': 3448439,
      'name': 'São Paulo',
      'cod': 200,
    };

    expect(
      () => WeatherModel.fromMap(map),
      throwsA(
        predicate(
          (e) =>
              e is RequiredKeysError &&
              e.message ==
                  'Trying to deserialize WeatherModel got error. '
                      'These keys are required: [description]!',
        ),
      ),
    );
  });

  testWidgets(
      'Given a map '
      'When non-nullable field is null '
      'Then should throw a RequiredKeysError', (tester) async {
    final map = {
      'weather': [
        {
          'id': 801,
          'main': 'Clouds',
          'description': null,
          'icon': '02d',
        }
      ],
      'base': 'stations',
      'main': {
        'temp': 30.25,
        'feels_like': 30.94,
        'temp_min': 28.58,
        'temp_max': 32.27,
        'pressure': 1020,
        'humidity': 47,
      },
      'visibility': 10000,
      'wind': {
        'speed': 4.63,
        'deg': 180,
      },
      'clouds': {
        'all': 20,
      },
      'dt': 1707152855,
      'sys': {
        'type': 2,
        'id': 2082654,
        'country': 'BR',
        'sunrise': 1707122873,
        'sunset': 1707169987,
      },
      'timezone': -10800,
      'id': 3448439,
      'name': 'São Paulo',
      'cod': 200,
    };

    expect(
      () => WeatherModel.fromMap(map),
      throwsA(
        predicate(
          (e) =>
              e is DisallowedNullValueError &&
              e.message ==
                  'Trying to deserialize WeatherModel got error. '
                      'These keys had `null` values, '
                      'which is not allowed: [description]',
        ),
      ),
    );
  });
}
