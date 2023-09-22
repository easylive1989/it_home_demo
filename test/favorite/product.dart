import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;

  const Product(this.id);

  @override
  List<Object?> get props => [id];
}
