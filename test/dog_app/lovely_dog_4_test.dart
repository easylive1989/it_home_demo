import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

late MockDogRepository mockDogRepository;

final getIt = GetIt.instance;

void main() {
  setUp(() {
    mockDogRepository = MockDogRepository();
    getIt.registerSingleton<DogRepository>(mockDogRepository);
  });

  testWidgets("show breed in dog app", (tester) async {
    when(() => mockDogRepository.get()).thenAnswer(
      (invocation) async => ["affenpinscher", "african", "airedale"],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DogBreedsWidget(),
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
  const DogBreedsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var repository = getIt<DogRepository>();
    return FutureBuilder<List<String>>(
      future: repository.get(),
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
