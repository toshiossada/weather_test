import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';
import 'package:weather_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Given I started Details Page '
    'When I fling to second page '
    'Should show tommorow`s weather',
    (tester) async {
      final df = DateFormat('dd/MM/yyyy');

      final today = df.format(DateTime.now());
      final tomorrow = df.format(DateTime.now().add(const Duration(days: 1)));
      app.main();
      await tester.pumpAndSettle();

      final tile = find.ancestor(
        of: find.text('São Paulo, Brazil'),
        matching: find.byType(ExpansionTile),
      );
      final iconButton =
          find.descendant(of: tile, matching: find.byType(IconButton));

      await tester.tap(iconButton);

      await tester.pumpAndSettle();
      expect(find.text(today), findsOneWidget);
      expect(find.text(tomorrow), findsNothing);
      await tester.fling(find.text(today), const Offset(-400, 0), 400);
      await tester.pumpAndSettle();

      expect(find.text(today), findsNothing);
      expect(find.text(tomorrow), findsOneWidget);
    },
  );
}
