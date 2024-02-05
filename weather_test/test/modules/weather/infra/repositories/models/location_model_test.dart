import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/core/helpers/helpers_errors.dart';
import 'package:weather_test/modules/weather/infra/repositories/models/location_model.dart';

void main() {
  testWidgets(
      'Given a map '
      'When all required fields are filled '
      'Then should return a LocationModel', (tester) async {
    final map = {
      'coord': {'lon': -46.6361, 'lat': -23.5475},
      'weather': [
        {'id': 800, 'main': 'Clear', 'description': 'clear sky', 'icon': '01d'},
      ],
      'base': 'stations',
      'main': {
        'temp': 296.43,
        'feels_like': 296.75,
        'temp_min': 293.9,
        'temp_max': 301.18,
        'pressure': 1022,
        'humidity': 74,
      },
      'visibility': 10000,
      'wind': {'speed': 1.54, 'deg': 80},
      'clouds': {'all': 0},
      'dt': 1707132779,
      'sys': {
        'type': 1,
        'id': 8394,
        'country': 'BR',
        'sunrise': 1707122873,
        'sunset': 1707169987,
      },
      'timezone': -10800,
      'id': 3448439,
      'name': 'São Paulo',
      'cod': 200,
    };

    final result = LocationModel.fromMap(map);

    expect(result.id, 3448439);
    expect(result.name, 'São Paulo');
    expect(result.latitude, -23.5475);
    expect(result.longitude, -46.6361);
  });

  testWidgets(
      'Given a map '
      'When missing required fields '
      'Then should throw a RequiredKeysError', (tester) async {
    final map = {
      'weather': [
        {'id': 800, 'main': 'Clear', 'description': 'clear sky', 'icon': '01d'},
      ],
      'base': 'stations',
      'main': {
        'temp': 296.43,
        'feels_like': 296.75,
        'temp_min': 293.9,
        'temp_max': 301.18,
        'pressure': 1022,
        'humidity': 74,
      },
      'visibility': 10000,
      'wind': {'speed': 1.54, 'deg': 80},
      'clouds': {'all': 0},
      'dt': 1707132779,
      'sys': {
        'type': 1,
        'id': 8394,
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
      () => LocationModel.fromMap(map),
      throwsA(
        predicate(
          (e) =>
              e is RequiredKeysError &&
              e.message ==
                  'Trying to deserialize LocationModel got error. '
                      'These keys are required: [coord]!',
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
        {'id': 800, 'main': 'Clear', 'description': 'clear sky', 'icon': '01d'},
      ],
      'coord': null,
      'base': 'stations',
      'main': {
        'temp': 296.43,
        'feels_like': 296.75,
        'temp_min': 293.9,
        'temp_max': 301.18,
        'pressure': 1022,
        'humidity': 74,
      },
      'visibility': 10000,
      'wind': {'speed': 1.54, 'deg': 80},
      'clouds': {'all': 0},
      'dt': 1707132779,
      'sys': {
        'type': 1,
        'id': 8394,
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
      () => LocationModel.fromMap(map),
      throwsA(
        predicate(
          (e) =>
              e is DisallowedNullValueError &&
              e.message ==
                  'Trying to deserialize LocationModel got error. '
                      'These keys had `null` values, '
                      'which is not allowed: [coord]',
        ),
      ),
    );
  });
}
