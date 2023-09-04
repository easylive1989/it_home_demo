import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/dog_app/lovely_dog_main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("show breed in dog app", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DogBreedsWidget())));

    await tester.pumpAndSettle();
    
    expect(find.text("affenpinscher"), findsOneWidget);
    expect(find.text("african"), findsOneWidget);
    expect(find.text("airedale"), findsOneWidget);
  });
}