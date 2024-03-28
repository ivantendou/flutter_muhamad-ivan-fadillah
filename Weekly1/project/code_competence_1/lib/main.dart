import 'package:flutter/material.dart';
import 'package:code_competence_1/page/contact_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickConnect',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const ContactPage(),
    );
  }

  
}