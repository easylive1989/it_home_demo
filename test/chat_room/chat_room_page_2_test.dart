import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/chat_room/chat_room_page_2.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

import 'chat_room_page_2_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ChatRoomRepository>(), MockSpec<FriendRepository>()])
main() {
  testWidgets("open create chat room page", (tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<ChatRoomRepository>(create: (context) => MockChatRoomRepository()),
        Provider<FriendRepository>(create: (context) => MockFriendRepository()),
      ],
      child: const MyApp(),
    ));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text("建立聊天室"), findsOneWidget);
  });
}
