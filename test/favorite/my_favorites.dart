import 'package:shared_preferences/shared_preferences.dart';

import 'product.dart';

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
