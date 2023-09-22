import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_product.dart';
import 'new_my_favorites.dart';

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