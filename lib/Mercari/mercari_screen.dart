import 'package:flutter/material.dart';

class MercariScreen extends StatelessWidget {
  const MercariScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // Appbarとメイン画面の境界線の影をなくす
        automaticallyImplyLeading: false, // デフォルトの戻るボタン(<)を削除
        title: const Text(
          '出品',
          style: const TextStyle(
            color: Color(0xff343434),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
