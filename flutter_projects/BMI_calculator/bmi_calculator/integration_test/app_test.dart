import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bmi_calculator/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end app test', () {
    var _weightIncrementButton = find.byKey(
      Key('weight_plus'),
    );
    var _ageIncrementButton = find.byKey(
      Key('age_plus'),
    );
    var _calculateBMIButton = find.byType(CupertinoButton);

    testWidgets(
        'Given app is ran When height, age data input and calculateBMI button pressed Then correct BMI returned',
        (tester) async {
      //arrangge
      app.main();
      //act
      await tester.pumpAndSettle();
      await tester.tap(_weightIncrementButton);
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.tap(_ageIncrementButton);
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.tap(_calculateBMIButton);
      await Future.delayed(Duration(seconds: 1));
      await tester.pumpAndSettle();
      final _resultText = find.text('normal');
      await Future.delayed(Duration(seconds: 1));
      //assert
      expect(_resultText, findsOneWidget);
    });
  });
}
