import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/long_builder/long_builder_main.dart';

main() {
  testWidgets("find item 99", (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.fling(find.byType(ListView), const Offset(0, -100), 10000);
    await tester.pumpAndSettle();

    expect(find.text("Title 99"), findsOneWidget);
  });
}