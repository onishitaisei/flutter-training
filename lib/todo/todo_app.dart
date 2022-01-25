import 'package:drift/drift.dart' as drift;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:training/db/db.dart';
import 'package:training/todo/todo_state_notifier.dart';

class ToDoApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _state = ref.watch(todoStateNotifier);
    final _notifier = ref.watch(todoStateNotifier.notifier);
    return Scaffold(
      body: _buildBody(_state, _notifier),
      floatingActionButton: _buildFloatingActionButton(context, _notifier),
    );
  }

  Widget _buildBody(_state, _notifier) {
    return SafeArea(
      child: Stack(
        children: [
          _state.isReadyData
              ? _buildTodoList(_state, _notifier)
              : const Center(
                  child: Text(
                    '登録しているTodoはありません',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          Visibility(
            visible: _state.isLoading,
            child: Container(
              color: const Color(0x88000000),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoList(_state, _notifier) {
    return ListView.builder(
      itemCount: _state.todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        final _data = _state.todoItems[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  print(_data.id);
                  _notifier.deleteTodoData(_data.id);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Column(
            children: [
              Column(
                children: [
                  ListTile(
                    title: _buildTitle(
                      _data,
                      index,
                    ),
                    subtitle: _buildSubTitle(_data),
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 1,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(_data, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'タイトル：${_data.title}',
          style: const TextStyle(fontSize: 12),
        ),
        Text(_data.content),
      ],
    );
  }

  Widget _buildSubTitle(_data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '作成日：${_data.createdAt}',
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          '期日：${_data.deadLine}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.yellow[700],
          ),
        ),
      ],
    );
  }

  FloatingActionButton _buildFloatingActionButton(
      BuildContext context, _notifier) {
    return FloatingActionButton(
      child: const Icon(Icons.edit),
      onPressed: () {
        _buildInputTodo(context, _notifier);
      },
    );
  }

  _buildInputTodo(BuildContext context, _notifier) {
    final _formKey = GlobalKey<FormState>();
    final _date = DateTime.now();
    final _format = DateFormat('yyyy-MM-dd');
    final _titleController = TextEditingController();
    final _contentController = TextEditingController();
    final _deadLineController = TextEditingController();

    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: SizedBox(
            height: 230,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '値を入力してください';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: 'タイトルを入力してください',
                      icon: Icon(Icons.text_fields_outlined),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '値を入力してください';
                      }
                      return null;
                    },
                    controller: _contentController,
                    decoration: const InputDecoration(
                      hintText: '内容を入力してください',
                      icon: Icon(Icons.notes),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '値を入力してください';
                      }
                      return null;
                    },
                    controller: _deadLineController,
                    onTap: () async {
                      final _date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2016),
                        lastDate: DateTime(2050),
                        helpText: '日付を選択',
                        cancelText: 'キャンセル',
                        confirmText: '決定',
                      );
                      final _formatDate = _format.format(_date!);
                      _deadLineController.text = _formatDate.toString();
                    },
                    decoration: const InputDecoration(
                      hintText: '期限を選択してください',
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // ボタン領域
            ElevatedButton(
              child: const Text("キャンセル"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text("保存"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final _newTodo = TodosCompanion(
                    // idはDrift側で自動生成
                    title: drift.Value(_titleController.text),
                    content: drift.Value(_contentController.text),
                    createdAt: drift.Value(_format.format(_date)),
                    deadLine: drift.Value(_deadLineController.text),
                  );
                  _notifier.insertTodoData(_newTodo);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
