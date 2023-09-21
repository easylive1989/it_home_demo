import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'purchase_product_service.dart';
import 'product.dart';
import 'wallet.dart';
import 'money_not_enough_exception.dart';
import 'wallet_repository.dart';
import 'product_repository.dart';

import 'purchase_product_service_normal_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>(), MockSpec<WalletRepository>()])
main() {
  test("should throw money not enough exception", () {
    var mockProductRepository = MockProductRepository();
    var mockWalletRepository = MockWalletRepository();

    when(mockWalletRepository.get()).thenAnswer((_) async => Wallet(50));

    var purchaseProductService = PurchaseProductService(mockProductRepository, mockWalletRepository);

    expect(() => purchaseProductService.execute(const Product(100)), throwsA(isA<MoneyNotEnoughException>()));
  });
}

