import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(
      providers: [
        Provider<ChatRoomRepository>(create: (context) => ChatRoomRepository()),
        Provider<FriendRepository>(create: (context) => FriendRepository()),
      ],
      child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ChatRoomListPage.routeName: (context) => const ChatRoomListPage(),
          CreateChatRoomPage.routeName: (context) => const CreateChatRoomPage(),
        },
      );
  }
}

class ChatRoomListPage extends StatefulWidget {
  static const routeName = "/";

  const ChatRoomListPage({super.key});

  @override
  State<ChatRoomListPage> createState() => _ChatRoomListPageState();
}

class _ChatRoomListPageState extends State<ChatRoomListPage> {
  @override
  Widget build(BuildContext context) {
    var chatRooms = context.read<ChatRoomRepository>().get();
    return Scaffold(
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
            await Navigator.of(context).pushNamed("/create");
            setState(() {});
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}

class CreateChatRoomPage extends StatefulWidget {
  static const routeName = "/create";

  const CreateChatRoomPage({super.key});

  @override
  State<CreateChatRoomPage> createState() => _CreateChatRoomPageState();
}

class _CreateChatRoomPageState extends State<CreateChatRoomPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<User> _selectedFriends = [];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var friends = context.read<FriendRepository>().get();
    return Scaffold(
      appBar: AppBar(title: const Text("建立聊天室")),
      body: Container(
        padding: const EdgeInsets.all(16),
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
            const Text("選擇好友"),
            Expanded(
              child: ListView.builder(
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: _selectedFriends.contains(friends[index]),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _selectedFriends.add(friends[index]);
                        } else {
                          _selectedFriends.remove(friends[index]);
                        }
                      });
                    },
                    title: Text(friends[index].name),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ChatRoomRepository>().add(ChatRoom(
                      _nameController.text,
                      _descriptionController.text,
                      friends,
                    ));
                Navigator.of(context).pop();
              },
              child: const Text("建立"),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatRoomRepository {
  final List<ChatRoom> _chatRooms = [
    const ChatRoom("韭菜投資群", "你不理財，財不理你", []),
    const ChatRoom("山道猴子討論區", "莫忘初衷", []),
  ];

  List<ChatRoom> get() => _chatRooms;

  void add(ChatRoom chatRoom) {
    if (_chatRooms.contains(chatRoom)) return;
    _chatRooms.add(chatRoom);
  }
}

class FriendRepository {
  List<User> get() => [
        const User("Alex"),
        const User("Bob"),
        const User("Cindy"),
      ];
}

class User extends Equatable {
  final String name;

  const User(this.name);

  @override
  List<Object?> get props => [name];
}

class ChatRoom extends Equatable {
  final String name;
  final String description;
  final List<User> members;

  const ChatRoom(this.name, this.description, this.members);

  @override
  List<Object?> get props => [name, description];
}
