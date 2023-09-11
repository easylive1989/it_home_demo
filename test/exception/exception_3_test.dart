import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exception_3_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PurchaseProductService>()])
main() {
  test("purchase fail", () async {
    var mockPurchaseProductService = MockPurchaseProductService();

    when(mockPurchaseProductService.execute(any)).thenThrow(MoneyNotEnoughException());

    var actual = await PurchaseProductController(mockPurchaseProductService).purchase(const Product(100));

    expect(actual, false);
  });
}

class PurchaseProductController {
  final PurchaseProductService purchaseProductService;

  PurchaseProductController(this.purchaseProductService);

  Future<bool> purchase(Product product) async {
    try {
      await purchaseProductService.execute(product);
      return true;
    } on MoneyNotEnoughException {
      return false;
    }
  }
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
