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
              Image.network(
                "https://raw.githubusercontent.com/easylive1989/images/master/static/images/2023IThome/Day20/ipman.jpg",
                errorBuilder: (context, error, stackTrace) => const Text("圖片載入失敗"),
              ),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Material(
                        child: Image.network(
                          "https://raw.githubusercontent.com/easylive1989/images/master/static/images/2023IThome/Day20/master_hong.jpg",
                          errorBuilder: (context, error, stackTrace) =>
                              const Text("圖片載入失敗"),
                        ),
                      ),
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
