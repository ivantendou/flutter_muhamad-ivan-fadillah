import 'package:flutter/material.dart';
import 'favorite_page.dart';
import 'serach_page.dart';
import 'information_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Widget Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // belum ada navigasi, untuk sementara dilakukan dengan hardcode (ganti langsung kodenya)
      home: FavoritePage(),
    );
  }
}
