import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/mvvm/model/youtube_information.dart';
import 'package:training/mvvm/youtube_client_state_notifier.dart';

class YoutubeScreen extends ConsumerWidget {
  YoutubeScreen({Key? key}) : super(key: key);
  final _backgroundColor = const Color(0xff2B272C);
  final _userIconColor = const Color(0xffA435F0);
  final _gridMenuColor = const Color(0xff1D191E);
  final _movieTextColor = const Color(0xffA59FA5);

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
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(youtubeClientStateNotifier);
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(state),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: _buildAppBarLogo(),
      actions: _buildAppBarActions(),
    );
  }

  Widget _buildAppBarLogo() {
    return Row(
      children: const [
        Image(
          width: 27,
          image: AssetImage(
            'images/youtube_img.png',
          ),
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

  List<Widget> _buildAppBarActions() {
    return [
      SizedBox(
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
      )
    ];
  }

  Widget _buildBody(state) {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              _buildMainMovies(state.youtubeInformation),
            ],
          ),
        ),
        Visibility(
          visible: state.isLoading,
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

  Widget _buildMainMovies(List<YoutubeInformation> youtubeInformation) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: youtubeInformation.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                index == 0
                    ? _buildGridMenus() // ListViewの要素の一つ目のみGridMenusを表示
                    : Container(),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      youtubeInformation[index].imagePath.toString(),
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
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: _userIconColor,
                        backgroundImage: NetworkImage(
                          youtubeInformation[index].iconPath.toString(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            youtubeInformation[index].title.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  youtubeInformation[index]
                                      .channelName
                                      .toString(),
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
                                  '${youtubeInformation[index].numOfViews}万 回視聴',
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
                                  '${youtubeInformation[index].daysAgo}日前',
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

  Widget _buildGridMenus() {
    return Column(
      children: [
        Container(
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
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 15.0,
            bottom: 15.0,
            left: 15.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              '急上昇動画',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
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
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
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
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
}
