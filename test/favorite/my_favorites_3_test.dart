import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  test("add favorite", () {
    var fakeSharedPreferences = FakeSharedPreferences();

    var myFavorites = MyFavorites(fakeSharedPreferences);

    myFavorites.add("1");

    expect(myFavorites.get(), ["1"]);
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

  MyFavorites(
    SharedPreferences preference,
  ) : _preferences = preference;

  Future<void> add(String productId) async {
    var favorites = get();
    favorites.add(productId);
    await _preferences.setStringList("favorites", favorites);
  }

  List<String> get() {
    return _preferences.getStringList("favorites") ?? [];
  }
}