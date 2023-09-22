import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'product.dart';
import 'my_favorites.dart';

main() {
  test("add favorite", () {
    var fakeSharedPreferences = FakeSharedPreferences();

    var myFavorites = MyFavorites(fakeSharedPreferences);

    myFavorites.add(const Product(1));

    expect(myFavorites.getAll(), [const Product(1)]);
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