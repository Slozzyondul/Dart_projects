import 'dart:math';

double calculateBMI(int height, int weight) {
  return 703 * (weight / pow(height, 2));
}