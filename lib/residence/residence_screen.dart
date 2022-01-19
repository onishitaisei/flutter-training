import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:training/mvvm/model/residence_information.dart';
import 'package:training/mvvm/residence_client_state_notifier.dart';
import 'package:training/mvvm/state/residence_client_state.dart';

// ignore: must_be_immutable
class ResidenceScreen extends ConsumerWidget {
  ResidenceScreen({Key? key}) : super(key: key);
  final _whiteColor = const Color(0xffFFFFFF);
  final _footerUnselectedIconColor = const Color(0xffCECECE);
  final _backgroundColor = const Color(0xffFAF8F5);
  final _primaryColor = const Color(0xff5BADA1);
  final _mainBtnColor = const Color(0xffC9C9C9);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _state = ref.watch(residenceClientStateNotifier);
    final Size _mediaSize = MediaQuery.of(context).size; // 画面サイズを取得
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(_mediaSize, _state),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _whiteColor,
      elevation: 3, // Appbarとメイン画面の境界線の影をなくす
      automaticallyImplyLeading: false, // デフォルトの戻るボタン(<)を削除
      title: _buildAppBarTag(),
      actions: _buildAppBarIcon(),
    );
  }

  Widget _buildAppBarTag() {
    return Row(
      children: [
        Container(
          width: 120,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffE9EFEE),
          ),
          child: Text(
            'カウルのおすすめ',
            style: TextStyle(
              color: _primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 120,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
              radius: 10,
              backgroundColor: Color(0xffE2554A),
              foregroundColor: Colors.white,
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> _buildAppBarIcon() {
    return [
      Container(
        width: 50,
        padding: const EdgeInsets.only(
          right: 15,
        ),
        child: CircleAvatar(
          radius: 10,
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            size: 25,
          ),
        ),
      )
    ];
  }

  Widget _buildBody(_mediaSize, ResidenceClientState _state) {
    return Stack(
      children: [
        _buildMainContents(_mediaSize, _state.residenceInformations),
        Visibility(
          visible: _state.isLoading,
          child: Container(
            color: const Color(0x88000000),
            child: const Center(
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyConditions(Size _mediaSize) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: Container(
          width: _mediaSize.width * 0.97,
          height: _mediaSize.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _whiteColor,
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
              _buildHeaderPropertyConditions(),
              _buildContents0fPropertyConditions(_mediaSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderPropertyConditions() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 13,
        right: 13,
        left: 13,
        bottom: 5,
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

  Widget _buildContents0fPropertyConditions(Size _mediaSize) {
    return Container(
      width: _mediaSize.width * 0.93,
      height: _mediaSize.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.train,
                  color: Colors.black87,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '東京駅・品川駅・川崎駅・横浜駅・目黒駅・恵比寿駅・渋谷駅・',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                Icon(
                  Icons.monetization_on,
                  color: Colors.black87,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '下限なし 〜 2,000万円',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                Icon(
                  Icons.info_outline,
                  color: Colors.black87,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '1R 〜 4LDK / 10㎡以上 / 徒歩20分',
                  style: TextStyle(
                    color: Colors.black87,
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

  Widget _buildMainContents(
      _mediaSize, List<ResidenceInformation> _residenceInformations) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: _residenceInformations.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                index == 0 ? _buildPropertyConditions(_mediaSize) : SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                  ),
                  child: Center(
                    child: Container(
                      width: _mediaSize.width * 0.97,
                      height: _mediaSize.height * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, //色
                            spreadRadius: 0.5,
                            blurRadius: 2,
                            offset: Offset(
                              1,
                              1,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildItemImage(
                            _mediaSize,
                            index,
                            _residenceInformations,
                          ),
                          _buildItemContent(
                            index,
                            _residenceInformations,
                          ),
                          _buildItemButton(_mediaSize),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }


  Widget _buildItemImage(Size _mediaSize, index,
      List<ResidenceInformation> _residenceInformations) {
    return SizedBox(
      height: _mediaSize.height * 0.23,
      child: Row(
        children: [
          Container(
            width: _mediaSize.width * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
              ),
              color: Color(0xffD8D9D8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'NO IMAGE',
                  style: TextStyle(
                    color: Color(0xff919191),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto Mono',
                  ),
                ),
                Icon(
                  Icons.business_outlined,
                  size: 50,
                ),
              ],
            ),
          ),
          SizedBox(
            width: _mediaSize.width * 0.45,
            child: Image.asset(
              _residenceInformations[index].layoutImagePath?.toString() ?? '',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemContent(int index) {
    final formatter = NumberFormat('#,###'); // 三桁ごとにカンマで区切るフォーマット
    final result = formatter.format(_createDummyData[index].price); // ダミーデータを加工
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _residenceInformations[index].title?.toString() ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            '$result万円',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(
                0xffEA7961,
              ),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.train,
                color: Colors.black87,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                _residenceInformations[index].accessInfo?.toString() ?? "",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              const Icon(
                Icons.space_dashboard_rounded,
                color: Colors.black87,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                _residenceInformations[index].roomInfo?.toString() ?? '',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              const Icon(
                Icons.business_outlined,
                color: Colors.black87,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                _residenceInformations[index].oldnessInfo?.toString() ?? '',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 11,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItemButton(Size _mediaSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _mediaSize.width * 0.45,
          height: _mediaSize.height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: _mainBtnColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.delete,
                color: _mainBtnColor,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('興味なし'),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: _mediaSize.width * 0.45,
          height: _mediaSize.height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: _mainBtnColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.favorite_border,
                color: _mainBtnColor,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('お気に入り'),
            ],
          ),
        ),
      ],
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: _primaryColor,
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.search),
          Text(
            '物件',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
            color: _footerUnselectedIconColor,
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
                  right: 5,
                  left: 3,
                ),
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: _footerUnselectedIconColor,
                  size: 35,
                ),
              ),
              const CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xffE2554A),
                foregroundColor: Colors.white,
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          label: 'メッセージ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.manage_accounts_outlined,
            color: _footerUnselectedIconColor,
            size: 35,
          ),
          label: 'マイページ',
        ),
      ],
      selectedItemColor: _primaryColor,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: Colors.grey[600],
      selectedFontSize: 13,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
    );
  }
}