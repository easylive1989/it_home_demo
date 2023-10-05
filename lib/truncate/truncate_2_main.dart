import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.monetization_on, size: 34),
                  SizedBox(width: 8),
                  Text("5.69%", style: TextStyle(fontSize: 34)),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Icon(Icons.wallet_travel, size: 34),
                  SizedBox(width: 8),
                  Text("105690\$", style: TextStyle(fontSize: 34)),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Icon(Icons.wallet, size: 34),
                  SizedBox(width: 8),
                  Text("100000\$", style: TextStyle(fontSize: 34)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
