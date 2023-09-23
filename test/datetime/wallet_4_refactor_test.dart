import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'wallet_4_refactor_test.mocks.dart';

late MockProductRepository mockProductRepository;
late MockWalletRepository mockWalletRepository;
late PurchaseProductService purchaseProductService;

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>()])
main() {
  setUp(() {
    mockProductRepository = MockProductRepository();
    mockWalletRepository = MockWalletRepository();
    purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository);
  });

  group("purchase product", (){
    test("purchase success", () async {
      given_wallet(Wallet(100));

      const product = Product(100);
      var coupon = Coupon(discount: 0.5, expiredAt: after(days: 10));

      await when_purchase(product, coupon);

      then_repository_should_be_call(product, coupon);
    });

    test("purchase fail", () {
      // ...
    });
  });

}

DateTime after({required int days}) => DateTime.now().add(Duration(days: days));

void then_repository_should_be_call(Product product, Coupon coupon) {
  verify(mockProductRepository.purchase(product, coupon)).called(1);
}

Future<void> when_purchase(Product product, Coupon coupon) async {
  await purchaseProductService.execute(product, coupon);
}

void given_wallet(Wallet wallet) {
  when(mockWalletRepository.get()).thenAnswer((_) async => wallet);
}

class PurchaseProductService {
  final ProductRepository productRepository;
  final WalletRepository walletRepository;

  PurchaseProductService(this.productRepository, this.walletRepository);

  Future<void> execute(Product product, Coupon? coupon) async {
    var now = DateTime.now();
    if (coupon?.expiredAt.isBefore(now) ?? false) {
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
  Future<void> purchase(Product product, Coupon? coupon) async {}
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

class Coupon extends Equatable {
  final double discount;
  final DateTime expiredAt;

  const Coupon({
    required this.discount,
    required this.expiredAt,
  });

  @override
  List<Object?> get props => [discount, expiredAt];
}

class WalletRepository {
  Future<Wallet> get() async => Wallet(100);
}
