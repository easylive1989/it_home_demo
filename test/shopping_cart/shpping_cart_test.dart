
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("purchase product success", () {
    var testProductRepository = TestProductRepository();

    var purchaseProductService = PurchaseProductService(testProductRepository);

    purchaseProductService.execute(const Product(100), Wallet(200));

    expect(testProductRepository.product, const Product(100));
  });
}

class TestProductRepository implements ProductRepository {
  Product? product;

  @override
  Future<void> purchase(Product product) async {
    this.product = product;
  }
}

class PurchaseProductService {
  final ProductRepository productRepository;

  PurchaseProductService(this.productRepository);

  void execute(Product product, Wallet wallet) {
    if (product.price > wallet.money) {
      throw MoneyNotEnoughException();
    }

    productRepository.purchase(product);
  }
}

class MoneyNotEnoughException implements Exception {}

class ProductRepository {
  Future<void> purchase(Product product) async {}
}

class Product extends Equatable {
  final double price;

  const Product(this.price);

  @override
  List<Object?> get props => [price];
}

class Wallet {
  final double money;

  Wallet(this.money);
}
