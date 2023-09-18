import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

main() {
  test("get user ok from api", () async {
    var stubClient = StubClient(Response("{\"id\":1, \"name\": \"Tom\"}", 200));

    var userRepository = UserRepository.create(stubClient);

    var user = await userRepository.get(1);

    expect(user, User(id: 1, name: "Tom"));
  });
}

class UserRepository {
  final Client client;

  UserRepository() : this.create(Client());

  UserRepository.create(this.client);

  Future<User> get(int userId) async {
    var response = await client
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

class StubClient implements Client {
  final http.Response response;

  StubClient(this.response);

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    return response;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {}
}
