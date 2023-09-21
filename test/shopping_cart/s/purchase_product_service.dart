import 'product_repository.dart';
import 'product.dart';
import 'wallet.dart';
import 'money_not_enough_exception.dart';

class PurchaseProductService {
  final ProductRepository productRepository;

  PurchaseProductService(this.productRepository);

  void execute(Product product, Wallet wallet) {
    if (product.price > wallet.money) {
      throw MoneyNotEnoughException();
    }

    productRepository.purchase(product);
  }
}
