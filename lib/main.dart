import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Mercari/mercari_screen.dart';
import 'async_await/async_screen.dart';
import 'flutter_tutorial_screen.dart';

import 'mvvm/qiita_client_screen.dart';
// import 'residence/residence_screen.dart';
import 'todo/todo_app.dart';
import 'youtube/youtube_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
        Locale.fromSubtags(languageCode: 'zh'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
        Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
        Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メイン画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FlutterTutorialScreen(),
                  ),
                );
              },
              child: const Text('Flutter tutorial'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YoutubeScreen(),
                  ),
                );
              },
              child: const Text('Youtube'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push<void>(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ResidenceScreen(),
            //       ),
            //     );
            //   },
            //   child: const Text('Residence'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MercariScreen(),
                  ),
                );
              },
              child: const Text('Mercari'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AsyncScreen(),
                  ),
                );
              },
              child: const Text('Async'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QiitaClientScreen()),
                );
              },
              child: const Text('Qiita'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToDoApp(),
                  ),
                );
              },
              child: const Text('DriftTodo'),
            ),
          ],
        ),
      ),
    );
  }
}
