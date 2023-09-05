// Mocks generated by Mockito 5.4.2 from annotations
// in it_home_demo/test/wallet/wallet_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;

import 'wallet_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWallet_0 extends _i1.SmartFake implements _i2.Wallet {
  _FakeWallet_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i2.ProductRepository {
  @override
  _i3.Future<void> purchase(
    _i2.Product? product,
    _i2.NewYearCoupon? coupon,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #purchase,
          [
            product,
            coupon,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [WalletRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWalletRepository extends _i1.Mock implements _i2.WalletRepository {
  @override
  _i3.Future<_i2.Wallet> get() => (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
        ),
        returnValue: _i3.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #get,
            [],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #get,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Wallet>);
}
