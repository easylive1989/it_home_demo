

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher/url_launcher.dart';

main() {
  testWidgets("should open t&c page when click t&c", (tester) async {
    await tester.pumpWidget(const MaterialApp(home: TermAndCondition()));

    await tester.tap(find.text("Terms & Conditions"));

    // 如何驗證

  });
}


class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse("https://www.google.com"));
      },
      child: const Center(
        child: Text(
          'Terms & Conditions',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}