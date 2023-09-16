import 'package:flutter_test/flutter_test.dart';

main() {
  test("index 0 should be 1", () async {
    var fibonacci = Fibonacci();

    var actual = fibonacci.find(0);

    expect(actual, 1);
  });
}

class Fibonacci {
  int find(int index) {
    if (index == 0 || index == 1) {
      return 1;
    }
    return find(index - 2) + find(index - 1);
  }
}