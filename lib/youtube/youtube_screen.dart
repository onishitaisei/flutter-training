import 'package:flutter/material.dart';

class YoutubeScreenPage extends StatelessWidget {
  const YoutubeScreenPage({Key? key}) : super(key: key);
  final backgroundColor = const Color(0xff2B272C);
  final userIconColor = const Color(0xffA435F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return SizedBox(
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

  Widget gridMenu() {
    return Container();
  }
}
