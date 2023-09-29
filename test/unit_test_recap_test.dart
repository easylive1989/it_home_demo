import 'package:flutter_test/flutter_test.dart';

main() {
  Calculator calculator = Calculator();

  test("0 + 2 = 2", () {
    calculator.add(2);

    expect(calculator.result, 2);
  });

  test("2 - 2 = 0", () {
    calculator.add(-2);

    expect(calculator.result, 0);
  });
}

class Calculator {
  int result = 0;

  void add(int number) {
    result += number;
  }
}
