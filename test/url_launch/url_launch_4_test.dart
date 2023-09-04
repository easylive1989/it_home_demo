import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

main() {
  testWidgets("should open t&c page when click t&c", (tester) async {
    var mockUrlLauncher = MockUrlLauncher();
    UrlLauncherPlatform.instance = mockUrlLauncher;

    await tester.pumpWidget(const MaterialApp(home: TermAndCondition()));

    await tester.tap(find.text("Terms & Conditions"));

    expect(mockUrlLauncher.url, "https://www.google.com");
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

class MockUrlLauncher extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  String? url;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    this.url = url;
    return true;
  }
}
