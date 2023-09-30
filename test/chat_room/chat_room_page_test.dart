import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/chat_room/chat_room_page.dart';
import 'package:provider/provider.dart';

main() {
  testWidgets("create chat room success", (tester) async {
    await givenView(tester, const ChatRoomPage());

    await whenTapAddButton(tester);

    await whenEnterChatRoomName(tester, "地球暖化討論群");

    await whenEnterChatRoomDescription(tester, "愛地球");

    await whenTapCreateButton(tester);

    thenShowText("地球暖化討論群");
    thenShowText("愛地球");
  });

  testWidgets("cancel chat room creation", (tester) async {
    await givenView(tester, const ChatRoomPage());

    await whenTapAddButton(tester);

    await whenEnterChatRoomName(tester, "地球暖化討論群");

    await whenEnterChatRoomDescription(tester, "愛地球");

    await tester.tapAt(const Offset(0, 0));
    await tester.pump();

    expect(find.text("地球暖化討論群"), findsNothing);
    expect(find.text("愛地球"), findsNothing);
  });

  testWidgets("delete chat room", (tester) async {
    var fakeChatRoomRepository = FakeChatRoomRepository();
    fakeChatRoomRepository.add(const ChatRoom("韭菜投資群組", "你不理財，財不理你"));

    await givenView(tester, const ChatRoomPage(), repository: fakeChatRoomRepository);

    await tester.drag(find.text("韭菜投資群組"), const Offset(-500, 0));
    await tester.pumpAndSettle();

    expect(find.text("韭菜投資群組"), findsNothing);
    expect(find.text("你不理財，財不理你"), findsNothing);
  });
}

void thenShowText(String text) {
  expect(find.text(text), findsOneWidget);
}

Future<void> whenTapCreateButton(WidgetTester tester) async {
  await tester.tap(find.text("建立"));
  await tester.pump();
}

Future<void> whenEnterChatRoomDescription(
    WidgetTester tester, String text) async {
  await tester.enterText(
    find.byWidgetPredicate((widget) =>
        widget is TextField && widget.decoration?.labelText == "聊天室說明"),
    text,
  );
}

Future<void> whenEnterChatRoomName(WidgetTester tester, String text) async {
  await tester.enterText(
    find.byWidgetPredicate((widget) =>
        widget is TextField && widget.decoration?.labelText == "聊天室名稱"),
    text,
  );
}

Future<void> whenTapAddButton(WidgetTester tester) async {
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();
}

Future<void> givenView(WidgetTester tester, ChatRoomPage chatRoomPage,
    {ChatRoomRepository? repository}) async {
  await tester.pumpWidget(Provider<ChatRoomRepository>.value(
    value: repository ?? FakeChatRoomRepository(),
    child: chatRoomPage,
  ));
}

class FakeChatRoomRepository implements ChatRoomRepository {
  final List<ChatRoom> chatRooms = [];

  @override
  List<ChatRoom> get() => chatRooms;

  @override
  void add(ChatRoom chatRoom) {
    chatRooms.add(chatRoom);
  }
}
