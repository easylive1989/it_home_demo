import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(Provider.value(
    value: ChatRoomRepository(),
    child: const ChatRoomUserListWidget(),
  ));
}

class ChatRoomUserListWidget extends StatelessWidget {
  const ChatRoomUserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var userIds = context.read<ChatRoomRepository>().getJoinedUsesIds();
    return ListView.builder(
      itemCount: userIds.length,
      itemBuilder: (context, index) {
        return Provider(
          create: (context) => UserRepository(userIds[index]),
          child: const UserWidget(),
        );
      },
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var userRepository = context.read<UserRepository>();
    return const SizedBox();
  }
}

class ChatRoomRepository {
  List<int> getJoinedUsesIds() => [1, 2, 3, 4, 5];
}

class UserRepository {
  final int userId;

  UserRepository(this.userId);
}
