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
  String name = '';
  String birthday = '';
  int age = -1;

  void _setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        prefs.setString('name', name);
        prefs.setString('birthday', birthday);
        prefs.setInt('age', age);
      },
    );
  }

  void _cheackUserInformation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        name = prefs.getString('name') ?? '未設定';
        birthday = prefs.getString('birthday') ?? '未設定';
        age = prefs.getInt('age') ?? -1;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _cheackUserInformation();
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
            '名前 $name',
          ),
          Text(
            '年齢 ${age == -1 ? '未設定' : age}',
          ),
          Text(
            '誕生日 $birthday',
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff4DAF50),
      child: const Icon(Icons.add),
      onPressed: () {
        _buildProfileEditDialog(context);
      },
    );
  }

  _buildProfileEditDialog(context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("登録"),
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
                      name = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "名前",
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
                      age = int.parse(value);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "年齢",
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
                      birthday = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: "誕生日",
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // ボタン領域
            ElevatedButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text("保存"),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // フォームに問題がなかったときの処理
                  _setValue();
                  Navigator.pop(context);
                }
                // Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
