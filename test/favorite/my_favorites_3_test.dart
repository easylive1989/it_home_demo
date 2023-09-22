import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_favorites_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
main() {
  test("getAll", () {
    var mockSharedPreferences = MockSharedPreferences();

    when(mockSharedPreferences.getStringList("favorites")).thenReturn(['{"id":1,"type":"book"}']);

    var myFavorites = MyFavorites(mockSharedPreferences);

    expect(myFavorites.getAll(), [const Product(1, "book")]);
  });

  test("add favorite", () {
    var mockSharedPreferences = MockSharedPreferences();

    var myFavorites = MyFavorites(mockSharedPreferences);

    myFavorites.add(const Product(1, "book"));

    verify(mockSharedPreferences.setStringList("favorites", ['{"id":1,"type":"book"}']));
  });
}

class MyFavorites {
  final SharedPreferences _preferences;

  MyFavorites(SharedPreferences preference) : _preferences = preference;

  Future<void> add(Product product) async {
    var favorites = getAll();
    favorites.add(product);
    await _preferences.setStringList("favorites",
        favorites.map((product) => jsonEncode(product.toJson())).toList());
  }

  List<Product> getAll() {
    return _preferences
        .getStringList("favorites")
        ?.map((json) => Product.fromJson(jsonDecode(json)))
        .toList() ??
        [];
  }
}

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
