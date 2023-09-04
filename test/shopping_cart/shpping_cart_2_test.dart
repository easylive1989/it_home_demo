
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'shpping_cart_2_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>()])
main() {
  test("purchase product success", () {
    var mockProductRepository = MockProductRepository();

    var purchaseProductService = PurchaseProductService(mockProductRepository);

    purchaseProductService.execute(const Product(100), Wallet(200));

    verify(mockProductRepository.purchase(const Product(100))).called(1);
  });
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
