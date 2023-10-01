import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/chat_room/chat_room_page_3.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

import 'chat_room_page_3_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ChatRoomRepository>()])
main() {
  testWidgets("open create chat room page", (tester) async {
    var navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      Provider<ChatRoomRepository>(
        create: (context) => MockChatRoomRepository(),
        child: MaterialApp(
          home: const ChatRoomListPage(),
          navigatorKey: navigatorKey,
          onGenerateRoute: dummyRouteGenerator,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    navigatorKey.currentState?.pop("地球暖化討論群");
    await tester.pumpAndSettle();

    expect(find.text("地球暖化討論群 建立成功"), findsOneWidget);
  });
}

Route Function(RouteSettings) get dummyRouteGenerator =>
        (settings) => MaterialPageRoute(
        settings: settings, builder: (context) => const SizedBox());
