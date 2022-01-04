import 'package:flutter/material.dart';

class FlutterTutorialScreen extends StatelessWidget {
  const FlutterTutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Flutter tutorial screen'),
            ),
          ],
        ),
      ),
    );
  }
}
