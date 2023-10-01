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
          onGenerateRoute: dummyRouteGenerator,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    verify(mockNavigatorObserver.didPush(
      captureThat(RouteMatcher(routeName: CreateChatRoomPage.routeName)),
      any,
    ));
  });
}

Route Function(RouteSettings) get dummyRouteGenerator =>
    (settings) => MaterialPageRoute(
        settings: settings, builder: (context) => const SizedBox());

class RouteMatcher extends Matcher {
  final String routeName;
  final dynamic arguments;

  RouteMatcher({required this.routeName, this.arguments});

  @override
  Description describe(Description description) {
    return description.add('routeName: $routeName, arguments: $arguments');
  }

  @override
  bool matches(item, Map matchState) {
    return item.settings.name == routeName;
  }
}
