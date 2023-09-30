import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(Provider<ChatRoomRepository>(
    create: (context) => ChatRoomRepository(),
    child: const ChatRoomPage(),
  ));
}

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    var chatRooms = context.read<ChatRoomRepository>().get();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("聊天室列表")),
        body: Center(
          child: ListView.builder(
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(chatRooms[index].name),
                subtitle: Text(chatRooms[index].description),
                // trailing: const Icon(Icons.chevron_right),
                // onTap: () {},
              );
            },
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => const CreateChatRoomDialog(),
              );
              setState(() {});
            },
            child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}

class CreateChatRoomDialog extends StatefulWidget {
  const CreateChatRoomDialog({super.key});

  @override
  State<CreateChatRoomDialog> createState() => _CreateChatRoomDialogState();
}

class _CreateChatRoomDialogState extends State<CreateChatRoomDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "聊天室名稱",
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "聊天室說明",
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  context.read<ChatRoomRepository>().add(ChatRoom(
                        _nameController.text,
                        _descriptionController.text,
                      ));
                  Navigator.of(context).pop();
                },
                child: const Text("建立"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatRoom extends Equatable {
  final String name;
  final String description;

  const ChatRoom(this.name, this.description);

  @override
  List<Object?> get props => [name, description];
}

class ChatRoomRepository {
  final List<ChatRoom> _chatRooms = [
    const ChatRoom("韭菜投資群", "你不理財，財不理你"),
    const ChatRoom("山道猴子討論區", "莫忘初衷"),
  ];

  List<ChatRoom> get() => _chatRooms;

  void add(ChatRoom chatRoom) {
    if (_chatRooms.contains(chatRoom)) return;
    _chatRooms.add(chatRoom);
  }
}
