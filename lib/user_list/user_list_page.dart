import 'package:flutter/material.dart';

main() {
  runApp(const UserListPage(
    users: [
      "Paul",
      "Alex",
      "John",
      "Mary",
      "Bill",
      "Cindy",
      "David",
    ],
  ));
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key, required this.users});

  final List<String> users;

  @override
  Widget build(BuildContext context) {
    var sortedUsers = users.toList()..sort();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          itemCount: sortedUsers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(sortedUsers[index]),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
            );
          },
        ),
      ),
    );
  }
}
