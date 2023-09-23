import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'wallet_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<ProductRepository>(), MockSpec<WalletRepository>()])
main() {
  test("purchase product success", () {
    var mockProductRepository = MockProductRepository();
    var mockWalletRepository = MockWalletRepository();

    when(mockWalletRepository.get()).thenAnswer((_) async => Wallet(100));

    var purchaseProductService = PurchaseProductService(
      mockProductRepository,
      mockWalletRepository,
    );

    var coupon = const NewYearCoupon(discount: 0.5);
    const product = Product(100);
    purchaseProductService.execute(product, coupon);

    verify(mockProductRepository.purchase(product, coupon)).called(1);
  });
}

class PurchaseProductService {
  final ProductRepository productRepository;
  final WalletRepository walletRepository;

  PurchaseProductService(this.productRepository, this.walletRepository);

  Future<void> execute(Product product, NewYearCoupon? coupon) async {
    var now = DateTime.now();
    if (coupon != null && now.month != 1 && now.day != 1) {
      throw CouponInvalidException();
    }

    var wallet = await walletRepository.get();
    if (product.price > wallet.money) {
      throw MoneyNotEnoughException();
    }

    productRepository.purchase(product, coupon);
  }
}

class MoneyNotEnoughException implements Exception {}

class CouponInvalidException implements Exception {}

class ProductRepository {
  Future<void> purchase(Product product, NewYearCoupon? coupon) async {}
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

class NewYearCoupon extends Equatable {
  final double discount;

  const NewYearCoupon({
    required this.discount,
  });

  @override
  List<Object?> get props => [discount];
}

class WalletRepository {
  Future<Wallet> get() async => Wallet(100);
}
