import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dog_app/lovely_dog_2_test.dart';
import 'scheduler_4_test.mocks.dart';


@GenerateNiceMocks([MockSpec<WalletRepository>()])
main() {
  test("should update wallet", () {
    var mockWalletRepository = MockWalletRepository();

    UpdateWalletScheduler(mockWalletRepository).execute();

    verify(mockWalletRepository.update()).called(1);
  });
}

class UpdateWalletScheduler {
  final WalletRepository walletRepository;

  UpdateWalletScheduler(this.walletRepository);

  void start() {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) => execute(),
    );
  }

  void execute() {
    walletRepository.update();
  }
}

class WalletRepository {
  Future<void> update() async {}
}
