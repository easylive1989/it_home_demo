import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

main() {
  setUp(()=> registerFallbackValue(const LaunchOptions()));

  testWidgets("should open t&c page when click t&c", (tester) async {
    var mockUrlLauncher = MockUrlLauncher();
    UrlLauncherPlatform.instance = mockUrlLauncher;

    when(() => mockUrlLauncher.launchUrl(any(), any())).thenAnswer((invocation) async => true);

    await tester.pumpWidget(const MaterialApp(home: TermAndCondition()));

    await tester.tap(find.text("Terms & Conditions"));

    verify(() => mockUrlLauncher.launchUrl("https://www.google.com", any()));
  });
}

class MockUrlLauncher extends Mock with MockPlatformInterfaceMixin implements UrlLauncherPlatform {}

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
