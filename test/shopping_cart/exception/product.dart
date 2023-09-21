import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final double price;

  const Product(this.price);

  @override
  List<Object?> get props => [price];
}

