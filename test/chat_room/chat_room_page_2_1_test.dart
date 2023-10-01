import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/chat_room/chat_room_page_2.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'chat_room_page_2_1_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<ChatRoomRepository>(), MockSpec<NavigatorObserver>()])
main() {
  testWidgets("open create chat room page", (tester) async {
    var mockNavigatorObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      Provider<ChatRoomRepository>(
        create: (context) => MockChatRoomRepository(),
        child: MaterialApp(
          home: const ChatRoomListPage(),
          navigatorObservers: [mockNavigatorObserver],
          routes: {CreateChatRoomPage.routeName: (context) => const SizedBox()},
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    MaterialPageRoute
    var result = verify(mockNavigatorObserver.didPush(captureAny, any));
    expect(result.captured[1].settings.name, CreateChatRoomPage.routeName);
  });
}
