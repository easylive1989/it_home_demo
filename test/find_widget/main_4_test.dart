import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/find_widget/user_info_edit_extract_view.dart';

main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byType(EditNameSubmitButton));
    await tester.pump();

    expect(find.text("更新成功"), findsOneWidget);
  });
}