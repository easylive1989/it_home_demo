import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_favorites_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
main() {
  test("add favorite", () {
    var mockSharedPreferences = MockSharedPreferences();

    var myFavorites = MyFavorites(mockSharedPreferences);

    myFavorites.add("1");

    verify(mockSharedPreferences.setStringList("favorites", ["1"]));
  });
}

class MyFavorites {
  final SharedPreferences _preferences;

  MyFavorites(SharedPreferences preference) : _preferences = preference;

  Future<void> add(String productId) async {
    var favorites = getAll();
    favorites.add(productId);
    await _preferences.setStringList("favorites", favorites);
  }

  List<String> getAll() {
    return _preferences.getStringList("favorites") ?? [];
  }
}
