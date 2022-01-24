import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/db/db.dart';

final todoRepository = Provider(
  (ref) => TodoRepository(),
);

class TodoRepository {
  MyDatabase database = MyDatabase();
// 登録されているすべてのTodoを取得
  Future getAllTodoData() async {
    return await database.getAllTodoData;
  }

  // Todoを登録
  Future insertTodoData(todo) async {
    return await database.insertTodoData(todo);
  }

  // Todoを削除
  Future deleteTodoData(int index) async {
    return await database.deleteTodoData(index);
  }
}
