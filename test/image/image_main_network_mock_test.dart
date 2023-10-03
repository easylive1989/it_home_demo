import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/image/image_main_network.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

main() {
  testWidgets("show master hong's reply", (tester) async {
    await mockNetworkImages(() => tester.pumpWidget(const IpMan()));

    await tester.tap(find.text("看看洪師父怎麼說"));
    await tester.pump();

    expect(find.image(const NetworkImage("https://raw.githubusercontent.com/easylive1989/images/master/static/images/2023IThome/Day20/master_hong.jpg")), findsOneWidget);
  });
}
