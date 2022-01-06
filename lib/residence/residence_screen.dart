import 'package:flutter/material.dart';

class ResidenceScreen extends StatelessWidget {
  final _headerColor = const Color(0xffFFFFFF);
  final _backgroundColor = const Color(0xffF7F5F2);
  final _primaryColor = const Color(0xff5BADA1);

  const ResidenceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _headerColor,
        elevation: 3, // Appbarとメイン画面の境界線の影をなくす
        automaticallyImplyLeading: false, // デフォルトの戻るボタン(<)を削除
        title: _buildHeaderTag(),
        actions: [
          _buildHeaderIcon(),
        ],
      ),
    );
  }

  Widget _buildHeaderTag() {
    return Row(
      children: [
        Container(
          width: 120,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xffE9EFEE),
          ),
          child: Text(
            'カウルのおすすめ',
            style: TextStyle(
                color: _primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 120,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffF3F3F3),
                ),
                child: const Text(
                  'リフォーム済みの',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const CircleAvatar(
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              radius: 10,
              backgroundColor: Color(0xffE2554A),
              foregroundColor: Colors.white,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderIcon() {
    return Container(
        width: 50,
        padding: const EdgeInsets.only(right: 15.0),
        child: CircleAvatar(
          // flatingActionbuttonだと影を削除する方法がわからなかったので、CircleAvatarを使用しました。
          child: const Icon(
            Icons.add,
            size: 25,
          ),
          radius: 10,
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
        ));
  }
}
