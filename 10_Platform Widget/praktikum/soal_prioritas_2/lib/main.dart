import 'package:flutter/cupertino.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino App',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}
