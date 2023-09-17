import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

main() {
  test("get user ok from api", () async {
    var userRepository = UserRepository();

    var user = await userRepository.get(1);

    expect(user, const User(id: 1, name: "Leanne Graham"));
  });
}

class UserRepository {
  Future<User> get(int userId) async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/$userId"));
    return User.fromJson(jsonDecode(response.body));
  }
}

class User extends Equatable {
  final int id;
  final String name;

  const User({
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
  List<Object?> get props => [id, name];
}