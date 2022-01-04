import 'package:flutter/material.dart';

import 'flutter_tutorial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

// 画面遷移をする部分のコード
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // タイトルテキスト
        title: const Text('メイン画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FlutterTutorialScreen()),
                );
              },
              child: const Text('Flutter tutorial'),
            ),
          ],
        ),
      ),
    );
  }
}
