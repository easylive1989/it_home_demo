import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_favorites_test.mocks.dart';

import 'product.dart';
import 'my_favorites.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
main() {
  test("add favorite", () {
    var mockSharedPreferences = MockSharedPreferences();

    var myFavorites = MyFavorites(mockSharedPreferences);

    myFavorites.add(const Product(1));

    verify(mockSharedPreferences.setStringList("favorites", ["1"]));
  });

  test("getAll", () {
    var mockSharedPreferences = MockSharedPreferences();

    when(mockSharedPreferences.getStringList("favorites")).thenReturn(["1"]);

    var myFavorites = MyFavorites(mockSharedPreferences);

    expect(myFavorites.getAll(), [const Product(1)]);
  });
}