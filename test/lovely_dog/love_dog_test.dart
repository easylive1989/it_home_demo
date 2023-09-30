import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/dog_app/love_dog_1_5_main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'love_dog_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DogRepository>()])
void main() {
  testWidgets("show breed in dog app", (tester) async {
    MockDogRepository mockDogRepository = MockDogRepository();
    when(mockDogRepository.get()).thenAnswer(
      (invocation) async => ["affenpinscher", "african", "airedale"],
    );

    await tester.pumpWidget(MaterialApp(home: DogBreedsWidget(dogRepository: mockDogRepository)));
    await tester.pump();

    expect(find.text("affenpinscher"), findsOneWidget);
    expect(find.text("african"), findsOneWidget);
    expect(find.text("airedale"), findsOneWidget);
  });
}
