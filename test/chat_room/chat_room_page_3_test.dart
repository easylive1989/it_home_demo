import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/chat_room/chat_room_page_3.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

import 'chat_room_page_3_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ChatRoomRepository>(), MockSpec<FriendRepository>()])
main() {
  testWidgets("show chat room created message", (tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<ChatRoomRepository>(create: (context) => MockChatRoomRepository()),
        Provider<FriendRepository>(create: (context) => MockFriendRepository()),
      ],
      child: const MyApp(),
    ));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == "聊天室名稱"),
      "地球暖化討論群",
    );

    await tester.tap(find.text("建立"));
    await tester.pumpAndSettle();

    expect(find.text("地球暖化討論群 建立成功"), findsOneWidget);

  });
}
