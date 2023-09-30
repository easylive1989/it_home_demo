import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MaterialApp(home: DogBreedsWidget(dogRepository: DogRepository())));
}

class DogBreedsWidget extends StatelessWidget {
  const DogBreedsWidget({
    super.key,
    required this.dogRepository,
  });

  final DogRepository dogRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
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
      ),
    );
  }
}

class DogRepository {
  Future<List<String>> get() async {
    var response = await http.get(Uri.parse("https://dog.ceo/api/breeds/list/all"));

    return jsonDecode(response.body)["message"].keys.toList();
  }
}
