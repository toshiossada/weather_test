import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_test/app_module.dart';
import 'package:weather_test/modules/core/adapters/cache_adapter/cache_adapter.dart';
import 'package:weather_test/modules/core/adapters/cache_adapter/cache_hive/cache_hive.dart';
import 'package:weather_test/modules/weather/domain/entities/location_entity.dart';
import 'package:weather_test/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_test/modules/weather/presentation/pages/details/detail_page.dart';
import 'package:weather_test/modules/weather/presentation/stores/location_store.dart';
import 'package:weather_test/modules/weather/weather_module.dart';

import '../../../../../helpers/make_testable_widget.dart';
import 'detail_page_test.mocks.dart';

@GenerateMocks([LoctionStore, CacheHive])
void main() {
  final store = MockLoctionStore();
  final hive = MockCacheHive();
  List<LocationEntity> getMock() {
    return [
      LocationEntity(
        id: 1,
        name: 'São Paulo',
        latitude: 1,
        longitude: 1.4,
        country: 'Brazil',
        weathers: [
          WeatherEntity(
            temp: 10,
            feelsLike: 10,
            tempMin: 10,
            tempMax: 10,
            humidity: 10,
            description: 'Teste 1',
            dateTime: DateTime(2020, 10, 1, 7, 30),
            main: 'Sun',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 10,
            tempMin: 10,
            tempMax: 10,
            humidity: 10,
            description: 'Teste 2',
            dateTime: DateTime(2020, 10, 1, 10, 30),
            main: 'Sun',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 10,
            tempMin: 10,
            tempMax: 10,
            humidity: 10,
            description: 'Teste 3',
            dateTime: DateTime(2020, 10, 2, 7, 30),
            main: 'Sun',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 10,
            tempMin: 10,
            tempMax: 10,
            humidity: 10,
            description: 'Teste 4',
            dateTime: DateTime(2020, 10, 2, 10, 30),
            main: 'Snow',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 10,
            tempMin: 10,
            tempMax: 10,
            humidity: 10,
            description: 'Teste 5',
            dateTime: DateTime(2020, 10, 3, 7, 30),
            main: 'Rain',
          ),
          WeatherEntity(
            temp: 10,
            feelsLike: 10,
            tempMin: 10,
            tempMax: 10,
            humidity: 10,
            description: 'Teste 6',
            dateTime: DateTime(2020, 10, 3, 10, 30),
            main: 'Snow',
          ),
        ],
      ),
    ];
  }

  setUp(() {
    const channel = MethodChannel('plugins.flutter.io/path_provider');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return './test/cache/home_page_test';
    });
    Modular
      ..bindModule(AppModule())
      ..replaceInstance<ICacheAdapter>(hive)
      ..bindModule(WeatherModule())
      ..replaceInstance<LoctionStore>(store);

    when(store.location).thenAnswer((_) => getMock());
  });
  tearDown(() {
    Modular.destroy();
  });
  testWidgets(
      'Given I started DetailPage '
      'When city is equal 1 '
      'The Should I find the first weather', (tester) async {
    await tester.pumpWidget(
      makeTestableWidget(
        child: DetailPage(
          city: 1,
          controller: Modular.get(),
        ),
      ),
    );

    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Teste 1'), findsOneWidget);
    expect(find.text('Teste 2'), findsOneWidget);
    expect(find.text('01/10/2020'), findsOneWidget);
    expect(find.text('02/10/2020'), findsNothing);
  });

  testWidgets(
      'Given I started DetailPage '
      'When fling to the next page '
      'The Should I find the second weather', (tester) async {
    await tester.pumpWidget(
      makeTestableWidget(
        child: DetailPage(
          city: 1,
          controller: Modular.get(),
        ),
      ),
    );

    await tester.fling(find.text('Teste 1'), const Offset(-200, 0), 200);
    await tester.pumpAndSettle();

    expect(find.text('01/10/2020'), findsNothing);
    expect(find.text('02/10/2020'), findsOneWidget);
  });
}
