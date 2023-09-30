import 'package:flutter/material.dart';

main() {
  runApp(const ChatRoomPage());
}

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("聊天室列表")),
        body: Center(
            child: ListView(
          children: [
            ListTile(
              title: const Text("韭菜投資群"),
              subtitle: const Text("你不理財，財不理你"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              title: const Text("山道猴子討論區"),
              subtitle: const Text("莫忘初衷"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        )),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const CreateChatRoomDialog();
                },
              );
            },
            child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}

class CreateChatRoomDialog extends StatelessWidget {
  const CreateChatRoomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.7,
          color: Colors.white,
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "聊天室名稱",
                ),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "房間說明",
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: Navigator.of(context).pop,
                child: const Text("Create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatRoom {
  final String name;
  final String description;

  ChatRoom(this.name, this.description);
}

class ChatRoomRepository {
  List<ChatRoom> _chatRooms = [
    ChatRoom("韭菜投資群", "你不理財，財不理你"),
  ];



}