import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/user_list/user_list_page.dart';

main() {
  testWidgets("user should order by alphabetic", (tester) async {
    await tester.pumpWidget(const UserListPage(
      users: ["Paul", "Alex", "John", "Mary", "Bill", "Cindy", "David"],
    ));

    var texts = tester.widgetList<Text>(find.byType(Text));

    find.byWidgetPredicate((widget) => widget is Text && widget.data == "Alex");

    expect(
      texts.map((text) => text.data),
      ["Alex", "Bill", "Cindy", "David", "John", "Mary", "Paul"],
    );
  });
}
