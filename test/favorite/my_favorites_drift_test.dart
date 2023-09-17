import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'my_database.dart';

main() {
  test("add favorite", () async {
    MyDatabase database = MyDatabase(NativeDatabase.memory());

    var todoRepository = TodoRepository(database);

    await todoRepository.create("Buy milk");

    expect(await todoRepository.getAll(), [const Todo(id: 1, content: "Buy milk")]);

    await database.close();
  });
}

class TodoRepository {
  final MyDatabase database;

  TodoRepository(this.database);

  Future<void> create(String content) async {
    await database.createTodo(content);
  }

  Future<List<Todo>> getAll() async {
    return await database.getAll();
  }
}
