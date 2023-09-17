import 'package:drift/drift.dart';
part 'my_database.g.dart';


class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
}

@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<int> createTodo(String content) {
    return into(todos).insert(TodosCompanion.insert(content: content));
  }

  Future<List<Todo>> getAll() async {
    return await select(todos).get();
  }
}
