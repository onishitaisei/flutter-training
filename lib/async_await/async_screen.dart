import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  @override
  _AsyncScreen createState() => _AsyncScreen();
}

class _AsyncScreen extends State<AsyncScreen> {
  final _formKey = GlobalKey<FormState>();

  final int _impossibleAge = -1;
  String _name = '';
  String _birthday = '';
  late int _age = _impossibleAge;

  Future<void> _setValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        prefs
          ..setString('name', _name)
          ..setString('birthday', _birthday)
          ..setInt('age', _age);
      },
    );
  }

  Future<void> _checkUserInformation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        _name = prefs.getString('name') ?? '未設定';
        _birthday = prefs.getString('birthday') ?? '未設定';
        _age = prefs.getInt('age') ?? _impossibleAge;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _checkUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '名前 $_name',
          ),
          Text(
            '年齢 ${_age == _impossibleAge ? '未設定' : _age}',
          ),
          Text(
            '誕生日 $_birthday',
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff4DAF50),
      child: const Icon(Icons.add),
      onPressed: () {
        _buildProfileEditDialog(context);
      },
    );
  }

  Future<void> _buildProfileEditDialog(BuildContext context) {
    return showDialog<Future<void>>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('登録'),
          content: SizedBox(
            height: 270,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: true, // FloatingActionButton押下後、自動的にフォーカス
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '値を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _name = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: '名前',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number, // ファーカス時に数値のキーボードを表示
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ], // 数値の入力のみ受け付ける
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '値を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _age = int.parse(value);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: '年齢',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '値を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _birthday = value;
                    },
                    decoration: const InputDecoration(
                      labelText: '誕生日',
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // ボタン領域
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('保存'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // フォームに問題がなかったときの処理
                  _setValue();
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
