import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_starter/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End to End test', () {
    testWidgets('test the whole app', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final widget = find.text("some text");
      expect(widget, findsNothing);

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.textContaining("login"), findsNWidgets(2));
    });
  });
}
