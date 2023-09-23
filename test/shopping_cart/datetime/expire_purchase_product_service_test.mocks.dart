// Mocks generated by Mockito 5.4.2 from annotations
// in it_home_demo/test/shopping_cart/datetime/expire_purchase_product_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;

import 'product.dart' as _i5;
import 'product_repository.dart' as _i3;
import 'time_repository.dart' as _i7;
import 'wallet.dart' as _i2;
import 'wallet_repository.dart' as _i6;

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

class _FakeDateTime_1 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_1(
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
class MockProductRepository extends _i1.Mock implements _i3.ProductRepository {
  @override
  _i4.Future<void> purchase(
    _i5.Product? product,
    dynamic coupon,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #purchase,
          [
            product,
            coupon,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [WalletRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWalletRepository extends _i1.Mock implements _i6.WalletRepository {
  @override
  _i4.Future<_i2.Wallet> get() => (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
        ),
        returnValue: _i4.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #get,
            [],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Wallet>.value(_FakeWallet_0(
          this,
          Invocation.method(
            #get,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Wallet>);
}

/// A class which mocks [TimeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTimeRepository extends _i1.Mock implements _i7.TimeRepository {
  @override
  DateTime now() => (super.noSuchMethod(
        Invocation.method(
          #now,
          [],
        ),
        returnValue: _FakeDateTime_1(
          this,
          Invocation.method(
            #now,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeDateTime_1(
          this,
          Invocation.method(
            #now,
            [],
          ),
        ),
      ) as DateTime);
}
