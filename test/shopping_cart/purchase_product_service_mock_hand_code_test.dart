import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';


main() {
  test("purchase product success", () {
    var mockProductRepository = MockProductRepository();

    mockProductRepository.setExpectedCallCount(1);
    mockProductRepository.setExpectedProduct(const Product(100));

    var purchaseProductService = PurchaseProductService(mockProductRepository);

    purchaseProductService.execute(const Product(100), Wallet(200));

    mockProductRepository.verify();
  });
}

class MockProductRepository implements ProductRepository {
  int expectedCallCount = 0;
  int actualCallCount = 0;
  Product? expectedProduct;
  Product? actualProduct;

  void setExpectedProduct(Product product) {
    expectedProduct = product;
  }

  void setExpectedCallCount(int count) {
    expectedCallCount = count;
  }

  @override
  Future<void> purchase(Product product) async {
    actualProduct = product;
    actualCallCount ++;
  }

  void verify() {
    expect(actualProduct, expectedProduct);
    expect(actualCallCount, expectedCallCount);
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
