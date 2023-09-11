import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exception_2_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>()])
main() {
  test("should throw money not enough exception", () async {
    var mockProductRepository = MockProductRepository();
    var mockWalletRepository = MockWalletRepository();

    when(mockWalletRepository.get()).thenAnswer((_) async => Wallet(50));

    var purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository);

    expect(() => purchaseProductService.execute(const Product(100)), throwsA(isA<MoneyNotEnoughException>()));
  });
}

class PurchaseProductService {
  final ProductRepository productRepository;
  final WalletRepository walletRepository;

  PurchaseProductService(this.productRepository, this.walletRepository);

  Future<void> execute(Product product) async {
    var wallet = await walletRepository.get();
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

class WalletRepository {
  Future<Wallet> get() async => Wallet(100);
}
