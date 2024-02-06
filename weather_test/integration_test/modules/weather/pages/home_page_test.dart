import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:weather_test/main.dart' as app;
import 'package:weather_test/modules/weather/presentation/stores/location_store.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Given I started Home Page '
    'When I tap São Paulo, Brazil '
    'Should expand tile and find weather description',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.tap(find.text('São Paulo, Brazil'));

      await tester.pump();

      final store = Modular.get<LoctionStore>();

      final location =
          store.location.firstWhere((element) => element.name == 'São Paulo');

      expect(
        find.text(location.weathers.values.first.first.description),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
    },
  );
}
