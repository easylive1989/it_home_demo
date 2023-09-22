import 'package:drift/drift.dart';

part 'my_database.g.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
}

@DriftDatabase(tables: [Products])
class MyDatabase extends _$MyDatabase {
  MyDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<int> createProduct(String type) {
    return into(products).insert(ProductsCompanion.insert(type: type));
  }

  Future<List<Product>> getAll() async {
    return await select(products).get();
  }
}
