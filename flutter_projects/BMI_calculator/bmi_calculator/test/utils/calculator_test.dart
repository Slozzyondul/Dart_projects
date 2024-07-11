import 'package:bmi_calculator/utils/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('give height and weight when calculateBMI function called then correct BMI retured', () {
    //arrange
    const int height = 70, weight = 160;

    //act
    double bmi = calculateBMI(height, weight);

    //assert
    expect(bmi, 22.955102040816328);
  });
}