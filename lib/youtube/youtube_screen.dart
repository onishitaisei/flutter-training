import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YoutubeScreen extends StatelessWidget {
  YoutubeScreen({Key? key}) : super(key: key);
  final _backgroundColor = const Color(0xff2B272C);
  final _userIconColor = const Color(0xffA435F0);
  final _gridMenuColor = const Color(0xff1D191E);
  final _movieTextColor = const Color(0xffA59FA5);

  // List<MovieInfo> _createDammyData() {
  //   return [
  //     MovieInfo('テスト', 'テスト', 'テスト', 'テスト', 'テスト', 'テスト'),
  //     MovieInfo('テスト1', 'テスト1', 'テスト1', 'テスト1', 'テスト1', 'テスト1'),
  //   ];
  // }

  List<MovieInfo> createDammyData = [
    MovieInfo(
      'images/arashi.jpg',
      'https://yt3.ggpht.com/ytc/AKedOLTrHCr-o1_G03azTDjkocuI4vGwBRpoeNUWtC6oew=s900-c-k-c0x00ffffff-no-rj',
      '"This is ARASHI LIVE 2020.12.31" Digest\nMovie',
      'ARASHI',
      100,
      1,
    ),
    MovieInfo(
      'images/arashi.jpg',
      'https://yt3.ggpht.com/ytc/AKedOLTrHCr-o1_G03azTDjkocuI4vGwBRpoeNUWtC6oew=s900-c-k-c0x00ffffff-no-rj',
      '"This is ARASHI LIVE 2020.12.31" Digest\nMovie',
      'ARASHI',
      200,
      2,
    ),
  ];

  final List<IconData> _gridIcon = [
    Icons.local_fire_department,
    Icons.music_note,
    Icons.gamepad,
    Icons.article,
    Icons.highlight_rounded,
    Icons.live_tv,
    Icons.sports
  ];
  final List<String> _gridText = [
    '急上昇',
    '音楽',
    'ゲーム',
    'ニュース',
    '学び',
    'ライブ',
    'スポーツ'
  ];
  final List<Color> _gridColor = [
    const Color(0xff851A36),
    const Color(0xff339988),
    const Color(0xffA6706C),
    const Color(0xff104A80),
    const Color(0xff147B50),
    const Color(0xffE26E34),
    const Color(0xff0A7792)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0, // Appbarとメイン画面の境界線の影をなくす
        automaticallyImplyLeading: false, // デフォルトの戻るボタン(<)を削除
        title: _buildHeaderLogo(),

        actions: [
          _buildHeaderIcons(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: Colors.white,
            ),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.control_point_outlined,
              size: 40,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.slow_motion_video_outlined,
              color: Colors.white,
            ),
            label: '登録チャンネル',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.slideshow,
              color: Colors.white,
            ),
            label: 'ライブラリ',
          ),
        ],

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType
            .fixed, // bottomnavigationが4つ以上の時は見えなくなってしまうため、type: BottomNavigationBarType.fixed,を追加
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildGridMenus(),
            _buildMainScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderLogo() {
    return Row(
      children: const [
        Image(
          width: 27,
          image: AssetImage('images/youtube_img.png'),
        ),
        Text(
          'YouTube',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            fontSize: 20,
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderIcons() {
    return SizedBox(
      width: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.cast,
            color: Colors.white,
          ),
          const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
          const Icon(
            Icons.search,
            color: Colors.white,
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: _userIconColor,
            child: const Text('t'),
          ),
        ],
      ),
    );
  }

  Widget _buildGridMenus() {
    return Container(
      color: _gridMenuColor,
      height: 230,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
          physics:
              const NeverScrollableScrollPhysics(), // GridViewをスクロールしないようにする
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          childAspectRatio: 3 / 0.7,
          children: List<Widget>.generate(
            _gridIcon.length,
            _buildGridMenu,
          ),
        ),
      ),
    );
  }

  Widget _buildGridMenu(int index) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: _gridColor[index],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Icon(
                _gridIcon[index],
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                _gridText[index],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainScreen() {
    return Expanded(
      // Column内にLisiViewを入れている場合はExpandedでラップする。この場合は親WidgetのこのColumnもExpandedでラップすることでエラー解決
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                '急上昇動画',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          _buildMainMovies(),
        ],
      ),
    );
  }

  Widget _buildMainMovies() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: createDammyData.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      createDammyData[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.leaderboard,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                '9:49',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: _userIconColor,
                        backgroundImage:
                            NetworkImage(createDammyData[index].iconPath),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            createDammyData[index].title,
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  createDammyData[index].channelName,
                                  style: TextStyle(
                                    color: _movieTextColor,
                                    fontSize: 13,
                                  ),
                                ),
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 3,
                                  color: _movieTextColor,
                                ),
                                Text(
                                  '${createDammyData[index].numOfViews}万 回視聴',
                                  style: TextStyle(
                                    color: _movieTextColor,
                                    fontSize: 13,
                                  ),
                                ),
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 3,
                                  color: _movieTextColor,
                                ),
                                Text(
                                  '${createDammyData[index].daysAgo}日前',
                                  style: TextStyle(
                                    color: _movieTextColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class MovieInfo {
  // 一つの動画に関するデータを管理
  late final imagePath; // サムネイル画像パス
  late final iconPath; // チャンネルのアイコン画像パス
  late final title; // 動画タイトル
  late final channelName; // チャンネル名
  late final numOfViews; // 再生回数
  late final daysAgo; // 何日前にアップロードされたか

  MovieInfo(
    this.imagePath,
    this.iconPath,
    this.title,
    this.channelName,
    this.numOfViews,
    this.daysAgo,
  );
}
