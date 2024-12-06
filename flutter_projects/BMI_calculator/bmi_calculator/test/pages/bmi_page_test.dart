import 'package:bmi_calculator/pages/bmi_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Given WeightInfoCard When user click +  button then weight increment by 1',
    (tester) async {
      //arrange
      await tester.pumpWidget(
        CupertinoApp(
          home: BMIPage(),
        ),
      );
      var _weightInrementButton = find.byKey(
        Key('weight_plus'),
      );
      //act
      await tester.tap(_weightInrementButton);
      await tester.pump();
      //assert
      var _text = find.text('161');
      expect(_text, findsOneWidget);
    },
  );

  testWidgets(
    'Given WeightInfoCard When user click -  button then weight decrement by 1',
    (tester) async {
      //arrange
      await tester.pumpWidget(
        CupertinoApp(
          home: BMIPage(),
        ),
      );
      var _weightInrementButton = find.byKey(
        Key('weight_minus'),
      );
      //act
      await tester.tap(_weightInrementButton);
      await tester.pump();
      //assert
      var _text = find.text('159');
      expect(_text, findsOneWidget);
    },
  );
}
