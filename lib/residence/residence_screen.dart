import 'package:flutter/material.dart';

class ResidenceScreen extends StatelessWidget {
  final _headerColor = const Color(0xffFFFFFF);
  final _footerIconColor = const Color(0xffCECECE);
  final _backgroundColor = const Color(0xffF7F5F2);
  final _primaryColor = const Color(0xff5BADA1);

  const ResidenceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 画面サイズを取得
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _backgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: _primaryColor,
              size: 35,
            ),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: _footerIconColor,
              size: 35,
            ),
            label: 'お気に入り',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5.0,
                    left: 3.0,
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: _footerIconColor,
                    size: 35,
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
            label: 'メッセージ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts_outlined,
              color: _footerIconColor,
              size: 35,
            ),
            label: 'マイページ',
          ),
        ],

        selectedItemColor: _primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 13,
        unselectedFontSize: 10,
        type: BottomNavigationBarType
            .fixed, // bottomnavigationが4つ以上の時は見えなくなってしまうため、type: BottomNavigationBarType.fixed,を追加
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          recommendation(size),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _primaryColor,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.search),
            Text(
              '物件',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 10),
            ),
          ],
        ),
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

  Widget recommendation(Size size) {
    return Center(
      child: Container(
        width: size.width * 0.97,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _headerColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, //色
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            recommendationHeader(),
            recommendationContents(size),
          ],
        ),
      ),
    );
  }

  Widget recommendationHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 13.0,
        right: 13.0,
        left: 13.0,
        bottom: 5.0,
      ),
      child: Row(
        children: [
          const Text(
            'カウルのおすすめ',
            style: TextStyle(
              color: Color(0xff424242),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            '新着3件',
            style: TextStyle(
              color: Color(0xffEA7961),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            '編集',
            style: TextStyle(
              color: _primaryColor,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            Icons.edit,
            color: _primaryColor,
          ),
        ],
      ),
    );
  }

  Widget recommendationContents(size) {
    return Container(
      width: size.width * 0.93,
      height: size.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: _backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.train,
                  color: Color(0xff6A6A6A),
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '東京駅・品川駅・川崎駅・横浜駅・目黒駅・恵比寿駅・渋谷駅・',
                  style: TextStyle(
                    color: Color(0xff6A6A6A),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.attach_money_sharp,
                  color: Color(0xff6A6A6A),
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '下限なし 〜 2,000万円',
                  style: TextStyle(
                    color: Color(0xff6A6A6A),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Color(0xff6A6A6A),
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '1R 〜 4LDK / 10㎡以上 / 徒歩20分',
                  style: TextStyle(
                    color: Color(0xff6A6A6A),
                    fontSize: 11,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
