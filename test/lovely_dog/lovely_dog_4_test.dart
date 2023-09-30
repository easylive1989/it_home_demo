import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/dog_app/lovely_dog_4_main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'lovely_dog_4_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DogRepository>()])
void main() {
  late MockDogRepository mockDogRepository;

  setUp(() {
    mockDogRepository = MockDogRepository();
    getIt.registerSingleton<DogRepository>(mockDogRepository);
  });

  testWidgets("show breed in dog app", (tester) async {
    when(mockDogRepository.get()).thenAnswer(
      (invocation) async => ["affenpinscher", "african", "airedale"],
    );

    await tester.pumpWidget(const MaterialApp(home: DogBreedsWidget()));

    await tester.pumpAndSettle();

    expect(find.text("affenpinscher"), findsOneWidget);
    expect(find.text("african"), findsOneWidget);
    expect(find.text("airedale"), findsOneWidget);
  });
}
