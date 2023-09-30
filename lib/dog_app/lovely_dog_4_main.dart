import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

main() {
  getIt.registerSingleton<DogRepository>(DogRepository());

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DogBreedsWidget(),
    ),
  );
}

class DogBreedsWidget extends StatelessWidget {
  const DogBreedsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var repository = getIt<DogRepository>();

    return Scaffold(
      body: FutureBuilder<List<String>>(
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
      ),
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
