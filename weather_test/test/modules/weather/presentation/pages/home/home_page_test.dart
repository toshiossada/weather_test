import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_test/app_module.dart';
import 'package:weather_test/modules/core/adapters/cache_adapter/cache_hive/cache_hive.dart';
import 'package:weather_test/modules/core/adapters/http_adapter/http_client_adapter.dart';
import 'package:weather_test/modules/core/adapters/http_adapter/http_response.dart';
import 'package:weather_test/modules/weather/presentation/pages/home/home_page.dart';
import 'package:weather_test/modules/weather/weather_module.dart';

import '../../../../../helpers/make_testable_widget.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([IHttpClientAdapter, IModularNavigator, CacheHive])
void main() {
  final client = MockIHttpClientAdapter();
  final navigate = MockIModularNavigator();

  Map<String, dynamic> getLocation(int id, String name) => {
        'coord': {
          'lon': Random().nextDouble() * 256,
          'lat': Random().nextDouble() * 256,
        },
        'id': id,
        'name': name,
      };

  Map<String, dynamic> getCurrent() => {
        'weather': [
          {
            'main': 'Clouds',
            'description': 'few clouds',
          }
        ],
        'main': {
          'temp': 30.25,
          'feels_like': 30.94,
          'temp_min': 28.58,
          'temp_max': 32.27,
          'pressure': 1020,
          'humidity': 47,
        },
        'dt': 1707152855,
      };

  Map<String, dynamic> getNextDays() => {
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
          },
          {
            'dt': 1707156000,
            'main': {
              'temp': 27.6,
              'feels_like': 28.26,
              'temp_min': 27.6,
              'temp_max': 29.58,
              'pressure': 1017,
              'sea_level': 1017,
              'grnd_level': 931,
              'humidity': 53,
              'temp_kf': -1.98,
            },
            'weather': [
              {
                'id': 803,
                'main': 'Clouds',
                'description': 'broken clouds',
                'icon': '04d',
              }
            ],
          },
          {
            'dt': 1707166800,
            'main': {
              'temp': 25.82,
              'feels_like': 26.05,
              'temp_min': 25.82,
              'temp_max': 25.82,
              'pressure': 1014,
              'sea_level': 1014,
              'grnd_level': 930,
              'humidity': 61,
              'temp_kf': 0,
            },
            'weather': [
              {
                'id': 500,
                'main': 'Rain',
                'description': 'light rain',
                'icon': '10d',
              }
            ],
          },
          {
            'dt': 1707177600,
            'main': {
              'temp': 22.74,
              'feels_like': 23.03,
              'temp_min': 22.74,
              'temp_max': 22.74,
              'pressure': 1016,
              'sea_level': 1016,
              'grnd_level': 931,
              'humidity': 75,
              'temp_kf': 0,
            },
            'weather': [
              {
                'id': 500,
                'main': 'Rain',
                'description': 'light rain',
                'icon': '10n',
              }
            ],
          },
          {
            'dt': 1707188400,
            'main': {
              'temp': 21.41,
              'feels_like': 21.7,
              'temp_min': 21.41,
              'temp_max': 21.41,
              'pressure': 1017,
              'sea_level': 1017,
              'grnd_level': 931,
              'humidity': 80,
              'temp_kf': 0,
            },
            'weather': [
              {
                'id': 803,
                'main': 'Clouds',
                'description': 'broken clouds',
                'icon': '04n',
              }
            ],
          },
          {
            'dt': 1707199200,
            'main': {
              'temp': 20.26,
              'feels_like': 20.48,
              'temp_min': 20.26,
              'temp_max': 20.26,
              'pressure': 1016,
              'sea_level': 1016,
              'grnd_level': 930,
              'humidity': 82,
              'temp_kf': 0,
            },
            'weather': [
              {
                'id': 803,
                'main': 'Clouds',
                'description': 'broken clouds',
                'icon': '04n',
              }
            ],
          },
          {
            'dt': 1707210000,
            'main': {
              'temp': 19.54,
              'feels_like': 19.77,
              'temp_min': 19.54,
              'temp_max': 19.54,
              'pressure': 1017,
              'sea_level': 1017,
              'grnd_level': 931,
              'humidity': 85,
              'temp_kf': 0,
            },
            'weather': [
              {
                'id': 804,
                'main': 'Clouds',
                'description': 'overcast clouds',
                'icon': '04d',
              }
            ],
          },
        ],
      };

  void setupStubs() {
    final map = [
      {'name': 'São Paulo', 'country': 'Brazil'},
      {'name': 'Silverstone', 'country': 'UK'},
      {'name': 'Melbourne', 'country': 'Australia'},
      {'name': 'Monte Carlo', 'country': 'Monaco'},
    ];

    for (final element in map) {
      final responsePosition = HttpResponse(
        statusCode: 200,
        data: getLocation(1, element['name']!),
      );
      final responseCurrent = HttpResponse(
        statusCode: 200,
        data: getCurrent(),
      );
      final responseGetNextDays = HttpResponse(
        statusCode: 200,
        data: getNextDays(),
      );
      final longitude = responsePosition.data['coord']['lon'];
      final latitude = responsePosition.data['coord']['lat'];

      when(client.get('/weather?q=${element['name']!},${element['country']!}'))
          .thenAnswer((_) async => responsePosition);
      when(client.get('/weather?lon=$longitude&lat=$latitude&units=metric'))
          .thenAnswer((_) async => responseCurrent);
      when(client.get('/forecast?lon=$longitude&lat=$latitude&units=metric'))
          .thenAnswer((_) async => responseGetNextDays);
    }
    when(navigate.pushNamed(any)).thenAnswer((_) async {
      return null;
    });
  }

  setUp(() {
    const channel = MethodChannel('plugins.flutter.io/path_provider');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return './test/cache/home_page_test';
    });
    Modular
      ..bindModule(AppModule())
      ..bindModule(WeatherModule())
      ..replaceInstance<IHttpClientAdapter>(client)
      ..navigatorDelegate = navigate;
    setupStubs();
  });

  tearDown(() {
    Modular.destroy();
  });

  testWidgets(
      'Given I started HomePage '
      'When I finish to load cities '
      'The Should I find the cities Text', (tester) async {
    await tester.pumpWidget(
      makeTestableWidget(
        child: HomePage(
          controller: Modular.get(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('Silverstone, UK'), findsOneWidget);
    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Melbourne, Australia'), findsOneWidget);
    expect(find.text('Monte Carlo, Monaco'), findsOneWidget);
  });

  testWidgets(
      'Given I load HomePage '
      'When Tab São Paulo, Brazil '
      'The see the weather', (tester) async {
    await tester.pumpWidget(
      makeTestableWidget(
        child: HomePage(
          controller: Modular.get(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.tap(find.text('São Paulo, Brazil'));

    await tester.pump();
    expect(find.text('few clouds'), findsOneWidget);
  });

  testWidgets(
      'Given I load HomePage '
      'When Tap details icon '
      'The should navigation to detals/:id', (tester) async {
    await tester.pumpWidget(
      makeTestableWidget(
        child: HomePage(
          controller: Modular.get(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final tile = find.ancestor(
      of: find.text('São Paulo, Brazil'),
      matching: find.byType(ExpansionTile),
    );
    final iconButton =
        find.descendant(of: tile, matching: find.byType(IconButton));

    await tester.tap(iconButton);

    verify(navigate.pushNamed('details/1'));
  });
}
