import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

main() {
  runApp(Provider.value(
    value: RepositoryA(),
    child: const UserListWidget(userId: 1),
  ));
}

class RepositoryA {}

class UserRepository {
  final int userId;

  UserRepository(this.userId);
}

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => UserRepository(userId),
      child: const UserWidget(),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
