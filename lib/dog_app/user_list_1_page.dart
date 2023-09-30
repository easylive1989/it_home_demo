import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

main() {
  getIt.registerSingleton<ChatRoomRepository>(ChatRoomRepository());


  runApp(const ChatRoomUserListWidget());
}

class ChatRoomUserListWidget extends StatelessWidget {
  const ChatRoomUserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var userIds = getIt<ChatRoomRepository>().getJoinedUsesIds();
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
    var repository = getIt<DogRepository>();
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
