import 'package:flutter/material.dart';
import 'package:soal_prioritas_1/page/date_color_file_picker_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Interactive Widgets';

    return const MaterialApp(
      title: appTitle,
      home: DateAndColorPickerPage(
        apptitle: appTitle,
      ),
    );
  }
}
