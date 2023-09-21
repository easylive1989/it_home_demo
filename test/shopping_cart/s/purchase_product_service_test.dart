import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product.dart';
import 'wallet.dart';
import 'product_repository.dart';
import 'purchase_product_service.dart';
import 'purchase_product_service_test.mocks.dart';


@GenerateNiceMocks([MockSpec<ProductRepository>()])
main() {
  test("purchase product success", () {
    var mockProductRepository = MockProductRepository();

    var purchaseProductService = PurchaseProductService(mockProductRepository);

    purchaseProductService.execute(const Product(100), Wallet(200));

    verify(mockProductRepository.purchase(const Product(100))).called(1);
  });
}