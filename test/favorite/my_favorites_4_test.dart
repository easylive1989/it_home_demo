import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  test("add favorite", () {
    var fakeSharedPreferences = FakeSharedPreferences();

    var myFavorites = MyFavorites(fakeSharedPreferences);

    myFavorites.add(const Product(1, "book"));

    expect(myFavorites.getAll(), [const Product(1, "book")]);
  });
}

class FakeSharedPreferences implements SharedPreferences {
  List<String> value = [];

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    this.value = value;
    return true;
  }

  @override
  List<String>? getStringList(String key) {
    return value;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
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
