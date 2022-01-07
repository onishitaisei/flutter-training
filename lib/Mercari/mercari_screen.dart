import 'package:flutter/material.dart';

class MercariScreen extends StatelessWidget {
  const MercariScreen({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  final _IconAndTextColor = const Color(0xff222222);
  final double _footerIconSize = 30.0;
  final double _floatingActionButtonSize = 70.0;
  final double _shortCutBtnWidth = 85.0;
  final double _shortCutBtnHeight = 100.0;

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
              color: _IconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_outlined,
              color: _IconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'お知らせ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _IconAndTextColor,
              size: _footerIconSize,
            ),
            label: '出品',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
              color: _IconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'メルペイ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: _IconAndTextColor,
              size: _footerIconSize,
            ),
            label: 'マイページ',
          ),
        ],

        selectedItemColor: _IconAndTextColor,
        unselectedItemColor: _IconAndTextColor,
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
          backgroundColor: const Color(0xffD25244),
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
      body: Column(
        children: [
          _buildShortCutToSell(),
        ],
      ),
    );
  }

  Widget _buildShortCutToSell() {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        left: 15.0,
        right: 15.0,
      ),
      color: const Color(0xffEFEFEF),
      child: Column(
        children: [
          _buildStartGuideImg(),
          _buildShortCutToSellContents(),
        ],
      ),
    );
  }

  Widget _buildStartGuideImg() {
    return const SizedBox(
      child: Image(
        image: AssetImage('images/start_guide.png'),
      ),
    );
  }

  Widget _buildShortCutToSellContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
          ),
          child: Text(
            '出品へのショートカット',
            style: TextStyle(
              color: Color(0xff868686),
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _shortCutBtnWidth,
              height: _shortCutBtnHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xffE9E9E9),
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: _IconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    '写真を撮る',
                    style: TextStyle(
                      color: _IconAndTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _shortCutBtnWidth,
              height: _shortCutBtnHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xffE9E9E9),
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter,
                    color: _IconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    'アルバム',
                    style: TextStyle(
                      color: _IconAndTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _shortCutBtnWidth,
              height: _shortCutBtnHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xffE9E9E9),
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner_outlined,
                    color: _IconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    'バーコード',
                    style: TextStyle(
                      color: _IconAndTextColor,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '(本・コスメ)',
                    style: TextStyle(
                      color: _IconAndTextColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _shortCutBtnWidth,
              height: _shortCutBtnHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xffE9E9E9),
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_chart_sharp,
                    color: _IconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    '下書き一覧',
                    style: TextStyle(
                      color: _IconAndTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
