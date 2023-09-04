import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runZonedGuarded(() => null, (error, stack) { });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: UserRepository().get(1),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data!.name),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class UserRepository {
  Future<User> get(int userId) async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users/$userId"));
    return User.fromJson(jsonDecode(response.body));
  }
}

class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}


