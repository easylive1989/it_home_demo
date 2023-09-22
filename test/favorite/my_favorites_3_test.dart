import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_my_favorites.dart';
import 'new_product.dart';
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