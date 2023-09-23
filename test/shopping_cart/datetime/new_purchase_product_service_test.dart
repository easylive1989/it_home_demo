import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product.dart';
import 'product_repository.dart';
import 'new_purchase_product_service.dart';
import 'new_purchase_product_service_test.mocks.dart';
import 'new_year_coupon.dart';
import 'time_repository.dart';
import 'wallet_repository.dart';
import 'wallet.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>(), MockSpec<TimeRepository>()])
main() {
  test("purchase product success", () async {
    var mockProductRepository = MockProductRepository();
    var mockWalletRepository = MockWalletRepository();
    var mockTimeRepository = MockTimeRepository();

    when(mockTimeRepository.now()).thenReturn(DateTime.parse('2023-01-01'));
    when(mockWalletRepository.get()).thenAnswer((_) async => Wallet(100));

    var purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository, mockTimeRepository);

    await purchaseProductService.execute(
        const Product(100),
        NewYearCoupon());

    verify(
      mockProductRepository.purchase(
          const Product(100),
          NewYearCoupon()),
    ).called(1);
  });
}
