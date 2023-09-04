import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher/url_launcher.dart';

main() {
  testWidgets("should open t&c page when click t&c", (tester) async {
    var testTermAndCondition = TestTermAndCondition();

    await tester.pumpWidget(MaterialApp(home: testTermAndCondition));

    await tester.tap(find.text("Terms & Conditions"));

    var element = tester.element<StatefulElement>(find.byWidget(testTermAndCondition)) ;
    var state = element.state as TestTermAndConditionState;
    expect(state.uri, Uri.parse("https://www.google.com"));
  });
}

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({super.key});

  @override
  State<TermAndCondition> createState() => TermAndConditionState();
}

class TermAndConditionState extends State<TermAndCondition> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openUri(Uri.parse("https://www.google.com"));
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

  void openUri(Uri uri) {
    launchUrl(uri);
  }
}

class TestTermAndCondition extends TermAndCondition {
  @override
  State<TermAndCondition> createState() => TestTermAndConditionState();
}

class TestTermAndConditionState extends TermAndConditionState {
  Uri? uri;

  @override
  void openUri(Uri uri) {
    this.uri = uri;
  }
}
