import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product.dart';
import 'product_repository.dart';
import 'expire_purchase_product_service.dart';
import 'expire_purchase_product_service_test.mocks.dart';
import 'coupon.dart';
import 'time_repository.dart';
import 'wallet_repository.dart';
import 'wallet.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>(), MockSpec<TimeRepository>()])
main() {
  test("use coupon when purchase product", () async {
    var mockProductRepository = MockProductRepository();
    var mockWalletRepository = MockWalletRepository();

    when(mockWalletRepository.get()).thenAnswer((_) async => Wallet(100));

    var purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository);

    const product = Product(100);
    var coupon = Coupon(
        discount: 0.5,
        expiredAt: DateTime.now().add(const Duration(days: 10),
        ));

    await purchaseProductService.execute(product, coupon);

    verify(mockProductRepository.purchase(product, coupon)).called(1);
  });
}
