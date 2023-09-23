import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product.dart';
import 'product_repository.dart';
import 'purchase_product_service.dart';
import 'purchase_product_service_test.mocks.dart';
import 'new_year_coupon.dart';
import 'wallet_repository.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>()])
main() {
  test("use coupon when purchase product", () {
    var mockProductRepository = MockProductRepository();
    var mockWalletRepository = MockWalletRepository();

    var purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository);

    purchaseProductService.execute(
        const Product(100),
        NewYearCoupon());

    verify(mockProductRepository.purchase(
        const Product(100),
        NewYearCoupon()),
    ).called(1);
  });
}