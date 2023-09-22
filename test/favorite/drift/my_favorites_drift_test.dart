import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'my_database.dart';
import 'my_favorites.dart';

main() {
  test("add favorite", () async {
    MyDatabase database = MyDatabase(NativeDatabase.memory());

    var myFavorites = MyFavorites(database);

    await myFavorites.add(const Product(id: 1, type: "book"));

    expect(await myFavorites.getAll(), [const Product(id: 1, type: "book")]);

    await database.close();
  });
}
