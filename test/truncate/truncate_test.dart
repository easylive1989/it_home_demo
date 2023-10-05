import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/truncate/truncate_2_main.dart';
import 'package:it_home_demo/truncate/truncate_3_main.dart';

main() {
  testWidgets("show wallet", (tester) async {
    final robotoMedium = rootBundle.load('assets/fonts/Roboto-Medium.ttf');
    final fontLoader = FontLoader('Roboto')..addFont(robotoMedium);
    await fontLoader.load();

    await tester.pumpWidget(const MyApp());

    expect(find.text("5.69%"), findsOneWidget);
  });

  testWidgets("show wallet 2", (tester) async {
    tester.view.platformDispatcher.textScaleFactorTestValue = 0.5;

    await tester.pumpWidget(const MyApp());

    expect(find.text("5.69%"), findsOneWidget);
  });

  testWidgets("check screen size", (tester) async {
    tester.view.platformDispatcher.textScaleFactorTestValue = 0.5;
    
    await tester.pumpWidget(const MyApp3());

    await tester.showKeyboard(find.byType(TextField));

    expect(find.text("5.69%"), findsOneWidget);
  });
}