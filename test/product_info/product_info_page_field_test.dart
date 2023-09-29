import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/product_info/product_info_page_2.dart';

main() {
  testWidgets("quantity should be correct", (tester) async {
    await tester.pumpWidget(const ProductInfoPage());

    var text = find.text("5").evaluate().single.widget as Text;

    expect(text.style?.color, isSameColorAs(Colors.red));
  });
}
