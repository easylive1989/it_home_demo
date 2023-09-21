import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';


///
/// purchase_product_service_test.dart
///
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

///
/// purchase_product_service.dart
///
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

///
/// money_not_enough_exception.dart
///
class MoneyNotEnoughException implements Exception {}

///
/// product_repository.dart
///
class ProductRepository {
  Future<void> purchase(Product product) async {}
}

///
/// product.dart
///
class Product extends Equatable {
  final double price;

  const Product(this.price);

  @override
  List<Object?> get props => [price];
}

/// wallet.dart
class Wallet {
  final double money;

  Wallet(this.money);
}
