import 'package:flutter/material.dart';

class YoutubeScreenPage extends StatelessWidget {
  YoutubeScreenPage({Key? key}) : super(key: key);
  final backgroundColor = const Color(0xff2B272C);
  final userIconColor = const Color(0xffA435F0);
  final gridMenuColor = const Color(0xff1D191E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            gridMenus(),
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
          physics: NeverScrollableScrollPhysics(), // GridViewをスクロールしないようにする
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
    Color(0xff851A36),
    Color(0xff339988),
    Color(0xffA6706C),
    Color(0xff104A80),
    Color(0xff147B50),
    Color(0xffE26E34),
    Color(0xff0A7792)
  ];

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
              SizedBox(
                width: 10,
              ),
              Text(
                gridText[index],
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
