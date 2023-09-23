import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product.dart';
import 'product_repository.dart';
import 'clock_purchase_product_service.dart';
import 'clock_purchase_product_service_test.mocks.dart';
import 'new_year_coupon.dart';
import 'wallet_repository.dart';
import 'wallet.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>()])
main() {
  test("use coupon when purchase product", () async {
    withClock(Clock.fixed(DateTime.parse('2023-01-01')), () async {
      var mockProductRepository = MockProductRepository();
      var mockWalletRepository = MockWalletRepository();

      when(mockWalletRepository.get()).thenAnswer((_) async => Wallet(100));

      var purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository);

      await purchaseProductService.execute(
          const Product(100),
          NewYearCoupon());

      verify(mockProductRepository.purchase(
          const Product(100),
          NewYearCoupon()),
      ).called(1);
    });
  });
}