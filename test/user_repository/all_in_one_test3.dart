
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("get user ok from api", () async {
    var shoppingCart = ShoppingCart();

    shoppingCart.addProduct(Product(10));
    shoppingCart.addProduct(Product(20));

    // shoppingCart.checkOut();

    expect(Wallet.instance.money, 70);
  });
}

class Wallet {
  static final Wallet instance = Wallet._internal();

  Wallet._internal();

  double _money = 100;

  double get money => _money;

  void deposit(double amount) {
    if (amount > _money) {
      throw Exception("Not enough money");
    }

    _money -= amount;
  }
}

class ShoppingCart {
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  void checkout() {
    var amount = _products.map((product) => product.price).sum;
    // addOrder();
    Wallet.instance.deposit(amount);
  }
}

class Product {
  final double price;

  Product(this.price);
}

class OrderRepositoryInventory {

}
