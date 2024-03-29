import 'package:flutter/material.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/constant/route_paths_cosntant.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/contact_page.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/gallery_page.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/detail_image_page.dart';

void main() {
  runApp(const MyApp());
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
        RoutePaths.contact: (context) => const ContactPage(),
        RoutePaths.gallery: (context) => const GalleryPage(),
        RoutePaths.detailImage: (context) => const DetailImagePage(),
      },
    );
  }
}
