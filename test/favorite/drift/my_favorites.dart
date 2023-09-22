import 'my_database.dart';

class MyFavorites {
  final MyDatabase database;

  MyFavorites(this.database);

  Future<void> add(Product product) async {
    await database.createProduct(product.type);
  }

  Future<List<Product>> getAll() async {
    return await database.getAll();
  }
}

