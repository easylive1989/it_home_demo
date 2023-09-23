import 'package:equatable/equatable.dart';

class Coupon extends Equatable {
  final double discount;
  final DateTime expiredAt;

  const Coupon({
    required this.discount,
    required this.expiredAt,
  });

  @override
  List<Object?> get props => [discount, expiredAt];
}
