import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/dog_app/lovely_dog_2_main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'lovely_dog_2_main_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DogRepository>()])
void main() {
  testWidgets("show breed in dog app", (tester) async {
    var mockDogRepository = MockDogRepository();
    when(mockDogRepository.get()).thenAnswer(
      (invocation) async => ["affenpinscher", "african", "airedale"],
    );

    await tester.pumpWidget(Provider<DogRepository>.value(
      value: mockDogRepository,
      child: const MaterialApp(home: DogBreedsWidget()),
    ));

    await tester.pump();

    expect(find.text("affenpinscher"), findsOneWidget);
    expect(find.text("african"), findsOneWidget);
    expect(find.text("airedale"), findsOneWidget);
  });
}
