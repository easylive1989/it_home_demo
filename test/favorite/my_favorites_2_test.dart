import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  test("add favorite", () {
    var fakeSharedPreferences = FakeSharedPreferences();

    var myFavorites = MyFavorites(fakeSharedPreferences);

    myFavorites.add("1");

    expect(myFavorites.getAll(), ["1"]);
  });
}

class FakeSharedPreferences implements SharedPreferences {
  List<String> fake = [];

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    fake = value;
    return true;
  }

  @override
  List<String>? getStringList(String key) {
    return fake;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MyFavorites {
  final SharedPreferences _preferences;

  MyFavorites(
    SharedPreferences preference,
  ) : _preferences = preference;

  Future<void> add(String productId) async {
    var favorites = getAll();
    favorites.add(productId);
    await _preferences.setStringList("favorites", favorites);
  }

  List<String> getAll() {
    return _preferences.getStringList("favorites") ?? [];
  }
}