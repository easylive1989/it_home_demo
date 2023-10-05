import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getIt<UriRepository>().open(Uri.parse("https://www.google.com"));
      },
      child: const SizedBox(),
    );
  }
}

class UriRepository {
  void open(Uri uri) => launchUrl(uri);
}
