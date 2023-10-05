import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

main() {
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
