import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas_2_dan_eksploraso/page/home_page.dart';
import 'package:soal_prioritas_2_dan_eksploraso/page/home_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatarly',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Colors.teal),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.teal,
          selectionHandleColor: Colors.teal,
        ),
      ),
      home: const HomePage(),
    );
  }
}
