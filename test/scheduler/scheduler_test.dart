import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'scheduler_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WalletRepository>()])
main() {
  test("update wallet after 5 seconds", () {
    var mockWalletRepository = MockWalletRepository();

    UpdateWalletScheduler(mockWalletRepository).start();

    verify(mockWalletRepository.update()).called(1);
  });
}

class UpdateWalletScheduler {
  final WalletRepository walletRepository;

  UpdateWalletScheduler(this.walletRepository);

  void start() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      walletRepository.update();
    });
  }
}

class WalletRepository {
  Future<void> update() async {}
}
