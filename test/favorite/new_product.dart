import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String type;

  const Product(this.id, this.type);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }

  @override
  List<Object?> get props => [id, type];
}
