import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/gen/assets.gen.dart';
import 'package:it_home_demo/image/image_main.dart';

main() {
  testWidgets("show master hong's reply", (tester) async {
    await tester.pumpWidget(const IpMan());

    await tester.tap(find.text("看看洪師父怎麼說"));
    await tester.pump();

    expect(find.image(AssetImage(Assets.masterHong.path)), findsOneWidget);
  });
}