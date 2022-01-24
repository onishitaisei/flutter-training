import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'db.g.dart';

class TodoData extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
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

@DriftDatabase(tables: [TodoData])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  // 保存されているすべてのtodoを取得
  Future get getAllTodoData => select(todoData).get();

  // todoを追加するメソッド
  Future<int> insertTodoData(todo) => into(todoData).insert(todo);

  // todoを削除するメソッド
  Future deleteTodoData(int index) =>
      (delete(todoData)..where((tbl) => tbl.id.equals(index))).go();
}
