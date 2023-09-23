import 'product_repository.dart';
import 'product.dart';
import 'money_not_enough_exception.dart';
import 'coupon_invalid_exception.dart';
import 'wallet_repository.dart';
import 'coupon.dart';

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