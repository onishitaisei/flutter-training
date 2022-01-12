import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  @override
  _AsyncScreen createState() => _AsyncScreen();
}

class _AsyncScreen extends State<AsyncScreen> {
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

  void delete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('name');
      prefs.remove('birthday');
      prefs.remove('age');
    });
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
          TextButton(
            onPressed: () => delete(),
            child: const Text('削除ボタン'),
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
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "名前",
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    age = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    labelText: "年齢",
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    birthday = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "誕生日",
                  ),
                ),
              ],
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
                _setValue();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
