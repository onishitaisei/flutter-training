import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'db.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 20)();
  TextColumn get content => text().withLength(min: 1, max: 100)();
  TextColumn get createdAt => text()();
  TextColumn get deadLine => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  // 保存されているすべてのtodoを取得
  Future<List<Todo>> get getAllTodoData => select(todos).get();

  // todoを追加するメソッド
  Future<int> insertTodoData(TodosCompanion todo) => into(todos).insert(todo);

  // todoを削除するメソッド
  Future<int> deleteTodoData(int id) =>
      (delete(todos)..where((tbl) => tbl.id.equals(id))).go();
}
