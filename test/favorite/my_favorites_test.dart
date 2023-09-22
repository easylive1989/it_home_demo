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

    when(mockSharedPreferences.getStringList("favorites")).thenReturn(["1"]);

    var myFavorites = MyFavorites(mockSharedPreferences);

    expect(myFavorites.getAll(), [const Product(1)]);
  });

  test("add favorite", () {
    var mockSharedPreferences = MockSharedPreferences();

    var myFavorites = MyFavorites(mockSharedPreferences);

    myFavorites.add(const Product(1));

    verify(mockSharedPreferences.setStringList("favorites", ["1"]));
  });
}

class MyFavorites {
  final SharedPreferences _preferences;

  MyFavorites(SharedPreferences preference) : _preferences = preference;

  Future<void> add(Product product) async {
    var favorites = getAll();
    favorites.add(product);
    await _preferences.setStringList("favorites",
        favorites.map((product) => product.id.toString()).toList());
  }

  List<Product> getAll() {
    return _preferences
            .getStringList("favorites")
            ?.map((id) => Product(int.parse(id)))
            .toList() ??
        [];
  }
}

class Product extends Equatable {
  final int id;

  const Product(this.id);

  @override
  List<Object?> get props => [id];
}
