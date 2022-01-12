import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MercariScreen extends StatelessWidget {
  MercariScreen({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  final _iconAndTextColor = const Color(0xff222222);
  final _dividerColor = const Color(0xffF1F1F2);
  final _shortCutToSellBtnsColor = const Color(0xffE9E9E9);
  final double _footerIconSize = 30.0;
  final double _floatingActionButtonSize = 70.0;
  final double _shortCutBtnWidth = 85.0;
  final double _shortCutBtnHeight = 100.0;

  final List _createDummyData = [
    ItemInfo(
      imagePath: 'images/camera.png',
      title: 'NikonD5500',
      price: 51000,
      numOfPeople: 446,
    ),
    ItemInfo(
      imagePath: 'images/camera.png',
      title: '早い者勝ち！【新品】ERA',
      price: 15700,
      numOfPeople: 177,
    ),
    ItemInfo(
      imagePath: 'images/camera.png',
      title: 'NikonD6000',
      price: 71000,
      numOfPeople: 320,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildBody() {
    return Scrollbar(
      isAlwaysShown: true,
      child: Column(
        children: [
          _buildShortCutToSell(),
          _buildItemsEasyToSell(),
        ],
      ),
    );
  }

  Widget _buildShortCutToSell() {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        left: 16.0,
        right: 16.0,
      ),
      color: const Color(0xffEFEFEF),
      child: Column(
        children: [
          _buildStartGuideImg(),
          _buildShortCutToSellBtns(),
        ],
      ),
    );
  }

  Widget _buildStartGuideImg() {
    return const SizedBox(
      child: Image(
        image: AssetImage(
          'images/start_guide.png',
        ),
      ),
    );
  }

  Widget _buildShortCutToSellBtns() {
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
                  color: _shortCutToSellBtnsColor,
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: _iconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    '写真を撮る',
                    style: TextStyle(
                      color: _iconAndTextColor,
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
                  color: _shortCutToSellBtnsColor,
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter,
                    color: _iconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    'アルバム',
                    style: TextStyle(
                      color: _iconAndTextColor,
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
                  color: _shortCutToSellBtnsColor,
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner_outlined,
                    color: _iconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    'バーコード',
                    style: TextStyle(
                      color: _iconAndTextColor,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '(本・コスメ)',
                    style: TextStyle(
                      color: _iconAndTextColor,
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
                  color: _shortCutToSellBtnsColor,
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_chart_sharp,
                    color: _iconAndTextColor,
                    size: 35,
                  ),
                  Text(
                    '下書き一覧',
                    style: TextStyle(
                      color: _iconAndTextColor,
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

  Widget _buildItemsEasyToSell() {
    return Expanded(
      child: Column(
        children: [
          _buildItemsEasyToSellTop(),
          _buildItems(),
        ],
      ),
    );
  }

  Widget _buildItemsEasyToSellTop() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        bottom: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '売れやすい持ち物',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '使わないモノを出品してみよう！',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            'すべて見る',
            style: TextStyle(
              color: Color(0xff73B1ED),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff73B1ED),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: _createDummyData.length,
        itemBuilder: (BuildContext context, int index) {
          final _formatter = NumberFormat("#,###");
          final _price = _formatter.format(_createDummyData[index].price);
          return Column(
            children: [
              Divider(
                thickness: 2,
                indent: 15.0,
                color: _dividerColor,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                  bottom: 4.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  children: [
                    Image(
                      width: 70,
                      image: AssetImage('${_createDummyData[index].imagePath}'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _createDummyData[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '¥$_price',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.local_fire_department,
                              color: Color(0xff4092E7),
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${_createDummyData[index].numOfPeople}人が探しています',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffD25244),
                      ),
                      onPressed: () {},
                      child: const Text('出品する'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return SizedBox(
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
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: _iconAndTextColor,
            size: _footerIconSize,
          ),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_outlined,
            color: _iconAndTextColor,
            size: _footerIconSize,
          ),
          label: 'お知らせ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_alt,
            color: _iconAndTextColor,
            size: _footerIconSize,
          ),
          label: '出品',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.qr_code,
            color: _iconAndTextColor,
            size: _footerIconSize,
          ),
          label: 'メルペイ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color: _iconAndTextColor,
            size: _footerIconSize,
          ),
          label: 'マイページ',
        ),
      ],
      selectedItemColor: _iconAndTextColor,
      unselectedItemColor: _iconAndTextColor,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      type: BottomNavigationBarType.fixed,
    );
  }
}

class ItemInfo {
  final String imagePath;
  final String title;
  final int price;
  final int numOfPeople;
  ItemInfo({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.numOfPeople,
  });
}
