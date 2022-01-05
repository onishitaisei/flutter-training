import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YoutubeScreenPage extends StatelessWidget {
  YoutubeScreenPage({Key? key}) : super(key: key);
  final backgroundColor = const Color(0xff2B272C);
  final userIconColor = const Color(0xffA435F0);
  final gridMenuColor = const Color(0xff1D191E);
  final movieTextColor = const Color(0xffA59FA5);
  List<IconData> gridIcon = [
    Icons.local_fire_department,
    Icons.music_note,
    Icons.gamepad,
    Icons.article,
    Icons.highlight_rounded,
    Icons.live_tv,
    Icons.sports
  ];
  List<String> gridText = ['急上昇', '音楽', 'ゲーム', 'ニュース', '学び', 'ライブ', 'スポーツ'];
  List<Color> gridColor = [
    const Color(0xff851A36),
    const Color(0xff339988),
    const Color(0xffA6706C),
    const Color(0xff104A80),
    const Color(0xff147B50),
    const Color(0xffE26E34),
    const Color(0xff0A7792)
  ];

  List<String> movieText = [
    '"This is ARASHI LIVE 2020.12.31" Digest\nMovie',
    '"This is ARASHI LIVE 2020.12.31" Digest\nMovie',
  ];

  List<String> movieImg = [
    'images/arashi.jpg',
    'images/arashi.jpg',
  ];

  List<String> channelName = [
    'ARASHI',
    'ARASHI',
  ];

  List<int> views = [127, 127];

  List<int> dayPrevious = [1, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
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
            header(),
            gridMenus(),
            mainScreen(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: [
              youtubeIcon(),
              const Spacer(),
              headerIcons(),
              CircleAvatar(
                radius: 15,
                backgroundColor: userIconColor,
                child: const Text('t'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget youtubeIcon() {
    return Row(
      children: const [
        Image(width: 27, image: AssetImage('images/youtube_img.png')),
        SizedBox(
          width: 3,
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

  Widget headerIcons() {
    return SizedBox(
      width: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.cast,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget gridMenus() {
    return Container(
      color: gridMenuColor,
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
            7,
            gridMenu,
          ),
        ),
      ),
    );
  }

  Widget gridMenu(int index) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: gridColor[index],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Icon(
                gridIcon[index],
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                gridText[index],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainScreen() {
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
          mainMovies(),
        ],
      ),
    );
  }

  Widget mainMovies() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: movieText.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  Image.asset(
                    movieImg[index],
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
                ]),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: userIconColor,
                        backgroundImage: const NetworkImage(
                            'https://yt3.ggpht.com/ytc/AKedOLTrHCr-o1_G03azTDjkocuI4vGwBRpoeNUWtC6oew=s900-c-k-c0x00ffffff-no-rj'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieText[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  channelName[index],
                                  style: TextStyle(
                                      color: movieTextColor, fontSize: 13),
                                ),
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 3,
                                  color: movieTextColor,
                                ),
                                Text(
                                  '${views[index]}万 回視聴',
                                  style: TextStyle(
                                      color: movieTextColor, fontSize: 13),
                                ),
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 3,
                                  color: movieTextColor,
                                ),
                                Text(
                                  '${dayPrevious[index]}日前',
                                  style: TextStyle(
                                      color: movieTextColor, fontSize: 13),
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
