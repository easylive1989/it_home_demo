import 'package:flutter/material.dart';

main() {
  runApp(const IpMan());
}

class IpMan extends StatelessWidget {
  const IpMan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/ipman.jpg"),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Material(child: Image.asset("assets/master_hong.jpg")),
                    );
                  },
                  child: const Text("看看洪師父怎麼說"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
