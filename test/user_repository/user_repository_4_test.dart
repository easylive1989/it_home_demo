// import 'dart:convert';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// main() {
//   test("get user ok from api", () async {
//     var userRepository = TestUserRepository(Response("{\"id\":1, \"name\": \"Tom\"}", 200));
//
//     var user = await userRepository.get(1);
//
//     expect(user, const User(id: 1, name: "Tom"));
//   });
// }
//
// class UserRepository {
//   final Client _client;
//
//   UserRepository() : this.create(Client());
//
//   UserRepository.create(Client client) : _client = client;
//
//   Future<User> get(int userId) async {
//     var response = await _client.get(Uri.parse("https://jsonplaceholder.typicode.com/users/$userId"));
//     return User.fromJson(jsonDecode(response.body));
//   }
// }
//
// class User extends Equatable {
//   final int id;
//   final String name;
//
//   const User({
//     required this.id,
//     required this.name,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
//
//   @override
//   List<Object?> get props => [id, name];
// }
//
