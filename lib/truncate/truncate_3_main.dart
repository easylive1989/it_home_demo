import 'package:flutter/material.dart';

main() {
  runApp(const MyApp3());
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Row(
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
              Builder(builder: (context) {
                var of = MediaQuery.of(context);
                print(of.size.height);
                return const SizedBox(
                  height: 100,
                  child: TextField(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
