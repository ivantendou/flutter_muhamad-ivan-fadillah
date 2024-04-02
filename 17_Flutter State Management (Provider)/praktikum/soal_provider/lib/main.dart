import 'package:flutter/material.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/constant/route_paths_cosntant.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/contact/contact_page.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/detail_image/detail_image_page.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/gallery/gallery_page.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/contact/contact_provider.dart' as contact_provider;
import 'package:soal_prioritas_2_dan_eksplorasi/page/gallery/gallery_provider.dart' as gallery_provider;
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => contact_provider.ContactProvider()),
        ChangeNotifierProvider(create: (_) => gallery_provider.GalleryProvider()),
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
        RoutePaths.contact: (context) => const ContactPage(),
        RoutePaths.gallery: (context) => const GalleryPage(),
        RoutePaths.detailImage: (context) => const DetailImagePage(),
      },
    );
  }
}
