import 'package:bmi_calculator/utils/calculator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  test(
      'give height and weight when calculateBMI function called then correct BMI retured',
      () {
    //arrange
    const int height = 70, weight = 160;

    //act
    double bmi = calculateBMI(height, weight);

    //assert
    expect(bmi, 22.955102040816328);
  });

  test(
    'given url when calculateBMIAsync invoked then correct bmi returned',
    () async {
      //arrange
      final _dioMock = DioMock();
      when(() => _dioMock.get('https://jsonkeeper.com/b/AKFA')).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions:
                RequestOptions(path: 'https://jsonkeeper.com/b/AKFA'),
            data: {
              "Sergio Ramos": [72, 165],
            },
          ),
        ),
      );
      //act
      var _result = await calculateBMIAsync(_dioMock);
      //assert
      expect(_result, 22.375578703703706);
    },
  );
}
  