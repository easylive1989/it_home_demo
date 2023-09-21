import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'retry_purchase_product_service.dart';
import 'product.dart';
import 'wallet_repository.dart';
import 'product_repository.dart';

import 'purchase_product_service_retry_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>()])
main() {
  test("retry when get wallet fail", () {
    var mockProductRepository = MockProductRepository();
    var mockWalletRepository = MockWalletRepository();

    when(mockWalletRepository.get()).thenThrow(Exception());

    var purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository);

    expect(() => purchaseProductService.execute(const Product(100)), throwsA(isA<Exception>()));
    verify(mockWalletRepository.get()).called(2);
  });
}

