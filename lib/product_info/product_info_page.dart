import 'package:flutter/material.dart';

main() {
  runApp(const ProductInfoPage());
}

class ProductInfoPage extends StatelessWidget {
  const ProductInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  "https://raw.githubusercontent.com/easylive1989/images/master/static/images/2023IThome/Day15/1.jpeg",
                  height: 300,
                  errorBuilder: (context, error, stackTrace) =>
                  const Text("圖片載入失敗"),
                ),
                const ProductType(type: "NC-C123X"),
                const Divider(),
                const ProductSize(label: "寬", value: "60"),
                const ProductSize(label: "深", value: "80"),
                const ProductSize(label: "高", value: "123"),
                const Divider(),
                const ProductPrice(price: "55,000"),
                const ProductQuantity(quantity: "60"),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("購買"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key, required this.quantity});

  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const Text("剩餘數量"), Text(quantity)],
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("價格", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(price),
      ],
    );
  }
}

class ProductType extends StatelessWidget {
  const ProductType({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("型號", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(type)
      ],
    );
  }
}

class ProductSize extends StatelessWidget {
  const ProductSize({
    super.key,
    required this.value,
    required this.label,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label), Text(value)],
    );
  }
}
