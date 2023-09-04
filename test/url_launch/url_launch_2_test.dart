

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher/url_launcher.dart';

main() {
  testWidgets("should open t&c page when click t&c", (tester) async {
    var testTermAndCondition = TestTermAndCondition();

    await tester.pumpWidget(MaterialApp(home: testTermAndCondition));

    await tester.tap(find.text("Terms & Conditions"));

    expect(testTermAndCondition.uri, Uri.parse("https://www.google.com"));
  });
}


class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openUrl(Uri.parse("https://www.google.com"));
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

  void openUrl(Uri uri) {
    launchUrl(uri);
  }
}

class TestTermAndCondition extends TermAndCondition {
  Uri? uri;

  @override
  void openUrl(Uri uri) {
    this.uri = uri;
  }
}
