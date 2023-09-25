import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'product.dart';
import 'my_favorites.dart';

main() {
  test("add favorite", () {
    var spySharedPreferences = SpySharedPreferences();

    var myFavorites = MyFavorites(spySharedPreferences);

    myFavorites.add(const Product(1));

    expect(spySharedPreferences.fake, ['1']);
  });
}

class SpySharedPreferences implements SharedPreferences {
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