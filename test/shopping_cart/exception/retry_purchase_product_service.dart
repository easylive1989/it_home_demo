import 'product_repository.dart';
import 'wallet_repository.dart';
import 'product.dart';
import 'wallet.dart';
import 'money_not_enough_exception.dart';

class PurchaseProductService {
  final ProductRepository productRepository;
  final WalletRepository walletRepository;

  PurchaseProductService(this.productRepository, this.walletRepository);

  Future<void> execute(Product product) async {
    var wallet = await _getWallet();
    if (product.price > wallet.money) {
      throw MoneyNotEnoughException();
    }

    productRepository.purchase(product);
  }

  Future<Wallet> _getWallet() async {
    try {
      return await walletRepository.get();
    } catch (e) {
      return await walletRepository.get();
    }
  }
}