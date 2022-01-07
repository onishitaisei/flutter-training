import 'package:flutter/material.dart';

class MercariScreen extends StatelessWidget {
  MercariScreen({Key? key}) : super(key: key);

  final _footerIconAndTextColor = const Color(0xff222222);
  final double _footerIconSize = 30.0;
  final double _floatingActionButtonSize = 70.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // Appbarとメイン画面の境界線の影をなくす
        automaticallyImplyLeading: false, // デフォルトの戻るボタン(<)を削除
        title: const Text(
          '出品',
          style: TextStyle(
            color: Color(0xff343434),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _footerIconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_outlined,
              color: _footerIconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'お知らせ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _footerIconAndTextColor,
              size: _footerIconSize,
            ),
            label: '出品',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
              color: _footerIconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'メルペイ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: _footerIconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'マイページ',
          ),
        ],

        selectedItemColor: _footerIconAndTextColor,
        unselectedItemColor: _footerIconAndTextColor,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        type: BottomNavigationBarType
            .fixed, // bottomnavigationが4つ以上の時は見えなくなってしまうため、type: BottomNavigationBarType.fixed,を追加
      ),
      floatingActionButton: SizedBox(
        width: _floatingActionButtonSize,
        height: _floatingActionButtonSize,
        child: FloatingActionButton(
          backgroundColor: Color(0xffD25244),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.camera_alt),
              Text(
                '出品',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}
