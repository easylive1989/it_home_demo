import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'scheduler_3_test.mocks.dart';



@GenerateNiceMocks([MockSpec<WalletRepository>()])
main() {
  test("update wallet after 5 seconds", () async {
      var mockWalletRepository = MockWalletRepository();

      UpdateWalletScheduler(mockWalletRepository).start();

      await Future.delayed(const Duration(seconds: 5));

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
