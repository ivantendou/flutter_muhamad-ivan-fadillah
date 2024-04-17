import 'package:flutter/material.dart';
import 'package:soal_storage/models/db_manager.dart';
import 'package:soal_storage/utils/constant/route_path_constant.dart';
import 'package:soal_storage/pages/contact/contact_page.dart';
import 'package:soal_storage/pages/login/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DbManager(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routes: {
        RoutePath.login: (context) => const LoginPage(),
        RoutePath.contact: (context) => const ContactPage(),
      },
    );
  }
}
