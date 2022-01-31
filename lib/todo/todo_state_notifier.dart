import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/mvvm/repository/todo_repository.dart';
import 'package:training/mvvm/state/todo_client_state.dart';

final todoStateNotifier =
    StateNotifierProvider<TodoStateNotifier, TodoClientState>(
  (ref) => TodoStateNotifier(),
);

class TodoStateNotifier extends StateNotifier<TodoClientState> {
  TodoStateNotifier() : super(const TodoClientState()) {
    getTodoData();
  }

  final _repository = TodoRepository();
  Future getTodoData() async {
    state = state.copyWith(isLoading: true);

    final todos = await _repository.getAllTodoData();

    if (todos.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        isReadyData: true,
        todoItems: todos,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        isReadyData: false,
        todoItems: [],
      );
    }
  }

  Future insertTodoData(todo) async {
    state = state.copyWith(isLoading: true);
    _repository.insertTodoData(todo);
    await getTodoData();
  }

  Future deleteTodoData(int id) async {
    await _repository.deleteTodoData(id);
    getTodoData();
  }
}
