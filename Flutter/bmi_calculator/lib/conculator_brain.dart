import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  late double bmi;

  CalculatorBrain(this.weight, this.height) {
    bmi = weight / pow(height / 100, 2);
  }

  String bmiResult() {
    return bmi.toStringAsFixed(1);
  }

  String bmiComment() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String bmiInterpretation() {
    if (bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more";
    } else if (bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more";
    }
  }
}
