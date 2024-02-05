import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_test/modules/core/adapters/http_adapter/http_client_adapter.dart';
import 'package:weather_test/modules/core/adapters/http_adapter/http_errors.dart';
import 'package:weather_test/modules/core/adapters/http_adapter/http_response.dart';
import 'package:weather_test/modules/weather/infra/datasources/weather_datasource.dart';
import 'package:weather_test/modules/weather/infra/repositories/models/location_model.dart';

import 'weather_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IHttpClientAdapter>()])
void main() {
  late final WeatherDatasource datasource;
  final client = MockIHttpClientAdapter();

  setUpAll(() {
    datasource = WeatherDatasource(client: client);
  });

  testWidgets(
      'Given a request GET in Client HTTP to getPosition '
      'When request sucessful '
      'Then should return a LocationModel', (tester) async {
    when(client.get(
      '/weather?q=São Paulo,Brazil',
    ),).thenAnswer((_) async => const HttpResponse(statusCode: 200, data: {
          'coord': {'lon': -46.6361, 'lat': -23.5475},
          'weather': [
            {
              'id': 800,
              'main': 'Clear',
              'description': 'clear sky',
              'icon': '01d',
            }
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
        },),);
    final result = await datasource.getPosition('São Paulo', 'Brazil');

    expect(result.id, 3448439);

    expect(result.latitude, -23.5475);
    expect(result.longitude, -46.6361);
    expect(result.name, 'São Paulo');
  });

  testWidgets(
      'Given a request GET in Client HTTP to getPosition '
      'When throws error on request '
      'Then should get a HttpClientError', (tester) async {
    when(client.get(
      '/weather?q=São Paulo,Brazil',
    ),).thenThrow(const HttpClientError(message: 'Erro Teste', statusCode: 500));
    final result = datasource.getPosition('São Paulo', 'Brazil');

    expect(
      () async => await result,
      throwsA(
        predicate(
          (e) =>
              e is HttpClientError &&
              e.message == 'Erro Teste' &&
              e.statusCode == 500,
        ),
      ),
    );
  });

  testWidgets(
      'Given a request GET in Client HTTP to getCurrentWeather '
      'When request sucessful '
      'Then should return a LocationModel', (tester) async {
    const location = LocationModel(
      id: 3448439,
      name: 'São Paulo',
      latitude: -23.5475,
      longitude: -46.6361,
    );

    when(client.get(
      '/weather?lon=${location.longitude}&lat=${location.latitude}&units=metric',
    ),).thenAnswer((_) async => const HttpResponse(statusCode: 200, data: {
          'coord': {'lon': -46.6372, 'lat': -23.5471},
          'weather': [
            {
              'id': 800,
              'main': 'Clear',
              'description': 'clear sky',
              'icon': '01d',
            }
          ],
          'base': 'stations',
          'main': {
            'temp': 23.25,
            'feels_like': 23.48,
            'temp_min': 20.75,
            'temp_max': 26.72,
            'pressure': 1022,
            'humidity': 71,
          },
          'visibility': 10000,
          'wind': {'speed': 1.54, 'deg': 80},
          'clouds': {'all': 0},
          'dt': 1707133370,
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
        },),);
    final result = await datasource.getCurrentWeather(location);

    expect(result.main, 'Clear');
    expect(result.description, 'clear sky');
    expect(
      result.dateTime,
      DateTime.fromMillisecondsSinceEpoch(1707133370 * 1000),
    );
    expect(result.temp, 23.25);
    expect(result.feelsLike, 23.48);
    expect(result.tempMin, 20.75);
    expect(result.tempMax, 26.72);
    expect(result.humidity, 71);
  });

  testWidgets(
      'Given a request GET in Client HTTP to getNextFiveDaysWeather '
      'When request sucessful '
      'Then should return a LocationModel', (tester) async {
    const location = LocationModel(
      id: 3448439,
      name: 'São Paulo',
      latitude: -23.5475,
      longitude: -46.6361,
    );

    when(client.get(
      '/forecast?lon=${location.longitude}&lat=${location.latitude}&units=metric',
    ),).thenAnswer((_) async => const HttpResponse(statusCode: 200, data: {
          'cod': '200',
          'message': 0,
          'cnt': 40,
          'list': [
            {
              'dt': 1707134400,
              'main': {
                'temp': 23.63,
                'feels_like': 23.95,
                'temp_min': 23.63,
                'temp_max': 25.49,
                'pressure': 1022,
                'sea_level': 1022,
                'grnd_level': 933,
                'humidity': 73,
                'temp_kf': -1.86,
              },
              'weather': [
                {
                  'id': 800,
                  'main': 'Clear',
                  'description': 'clear sky',
                  'icon': '01d',
                }
              ],
              'clouds': {'all': 0},
              'wind': {'speed': 0.7, 'deg': 359, 'gust': 0.81},
              'visibility': 10000,
              'pop': 0.16,
              'sys': {'pod': 'd'},
              'dt_txt': '2024-02-05 12:00:00',
            },
            {
              'dt': 1707145200,
              'main': {
                'temp': 25.48,
                'feels_like': 25.73,
                'temp_min': 25.48,
                'temp_max': 29.18,
                'pressure': 1020,
                'sea_level': 1020,
                'grnd_level': 933,
                'humidity': 63,
                'temp_kf': -3.7,
              },
              'weather': [
                {
                  'id': 500,
                  'main': 'Rain',
                  'description': 'light rain',
                  'icon': '10d',
                }
              ],
              'clouds': {'all': 22},
              'wind': {'speed': 2.21, 'deg': 166, 'gust': 1.31},
              'visibility': 10000,
              'pop': 0.28,
              'rain': {'3h': 0.12},
              'sys': {'pod': 'd'},
              'dt_txt': '2024-02-05 15:00:00',
            }
          ],
          'city': {
            'id': 3448439,
            'name': 'São Paulo',
            'coord': {'lat': -23.5475, 'lon': -46.6361},
            'country': 'BR',
            'population': 10021295,
            'timezone': -10800,
            'sunrise': 1707122873,
            'sunset': 1707169987,
          },
        },),);
    final result = await datasource.getNextFiveDaysWeather(location);

    expect(result.length, 2);
    expect(result[0].main, 'Clear');
    expect(result[0].description, 'clear sky');
    expect(
      result[0].dateTime,
      DateTime.fromMillisecondsSinceEpoch(1707134400 * 1000),
    );
    expect(result[0].temp, 23.63);
    expect(result[0].feelsLike, 23.95);
    expect(result[0].tempMin, 23.63);
    expect(result[0].tempMax, 25.49);
    expect(result[0].humidity, 73);
  });
}
