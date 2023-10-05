import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:it_home_demo/translation/translation_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

main() {
  testWidgets("show hello world", (tester) async {
    var localization = await AppLocalizations.delegate.load(const Locale("en"));

    await tester.pumpWidget(const MyApp());

    expect(find.text(localization.hello_world), findsOneWidget);
  });
}