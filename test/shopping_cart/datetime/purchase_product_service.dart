import 'product_repository.dart';
import 'product.dart';
import 'money_not_enough_exception.dart';
import 'coupon_invalid_exception.dart';
import 'wallet_repository.dart';
import 'new_year_coupon.dart';

class PurchaseProductService {
  final ProductRepository productRepository;
  final WalletRepository walletRepository;

  PurchaseProductService(this.productRepository, this.walletRepository);

  Future<void> execute(Product product, NewYearCoupon? coupon) async {
    var now = DateTime.now();
    if (_isUseCoupon(coupon) && !_isFirstOfJanuary(now)) {
      throw CouponInvalidException();
    }

    var wallet = await walletRepository.get();
    if (product.price > wallet.money) {
      throw MoneyNotEnoughException();
    }

    productRepository.purchase(product, coupon);
  }

  bool _isFirstOfJanuary(DateTime now) => now.month == 1 && now.day == 1;

  bool _isUseCoupon(NewYearCoupon? coupon) => coupon != null;
}