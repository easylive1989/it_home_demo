import 'dart:convert';
import 'package:http/http.dart';
import 'user.dart';

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