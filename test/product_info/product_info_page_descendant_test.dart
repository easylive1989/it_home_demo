import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/product_info/product_info_page.dart';

main() {
  testWidgets("show width component correctly", (tester) async {
    await tester.pumpWidget(const ProductInfoPage());

    expect(
        find.descendant(
          of: find.byType(ProductSize),
          matching: find.text("寬"),
        ),
        findsOneWidget);
  });
}
