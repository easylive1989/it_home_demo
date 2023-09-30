import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/dog_app/lovely_dog_main.dart';

void main() {
  testWidgets("show breed in dog app", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DogBreedsWidget()));

    expect(find.text("affenpinscher"), findsOneWidget);
    expect(find.text("african"), findsOneWidget);
    expect(find.text("airedale"), findsOneWidget);
  });
}