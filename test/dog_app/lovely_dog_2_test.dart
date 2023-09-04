import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

late MockDogRepository mockDogRepository;
void main() {
  setUp(() {
    mockDogRepository = MockDogRepository();
  });

  testWidgets("show breed in dog app", (tester) async {
    when(() => mockDogRepository.get()).thenAnswer(
      (invocation) async => ["affenpinscher", "african", "airedale"],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DogBreedsWidget(dogRepository: mockDogRepository),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.text("affenpinscher"), findsOneWidget);
    expect(find.text("african"), findsOneWidget);
    expect(find.text("airedale"), findsOneWidget);
  });
}

class MockDogRepository extends Mock implements DogRepository {}

class DogBreedsWidget extends StatelessWidget {
  const DogBreedsWidget({super.key, required this.dogRepository});

  final DogRepository dogRepository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: dogRepository.get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data![index]),
            );
          },
        );
      },
    );
  }
}

class DogRepository {
  Future<List<String>> get() async {
    var response =
        await http.get(Uri.parse("https://dog.ceo/api/breeds/list/all"));

    return jsonDecode(response.body)["message"].keys.toList();
  }
}
