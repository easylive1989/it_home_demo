import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

main() {
  UrlLauncherPlatform.instance = MockUrlLauncher();
  runApp(
    const MaterialApp(
      home: Scaffold(body: TermAndCondition()),
    ),
  );
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


class MockUrlLauncher implements UrlLauncherPlatform {
  @override
  LinkDelegate? get linkDelegate => null;

  @override
  Future<bool> canLaunch(String url) async => true;

  @override
  Future<bool> launch(
      String url, {
        required bool useSafariVC,
        required bool useWebView,
        required bool enableJavaScript,
        required bool enableDomStorage,
        required bool universalLinksOnly,
        required Map<String, String> headers,
        String? webOnlyWindowName,
      }) async {
    print("gg");
    return true;
  }

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    return true;
  }

  @override
  Future<void> closeWebView() async {}
}
