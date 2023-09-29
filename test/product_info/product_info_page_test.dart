import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/product_info/product_info_page.dart';

main() {
  testWidgets("quantity should be correct", (tester) async {
    await tester.pumpWidget(const ProductInfoPage());

    expect(find.text("60"), findsNWidgets(2));
  });
}