import 'package:contacts_app_mvvm/constant/route_paths_contant.dart';
import 'package:contacts_app_mvvm/screens/contact/contact_screen.dart';
import 'package:contacts_app_mvvm/screens/contact/contact_view_model.dart';
import 'package:contacts_app_mvvm/screens/detail_image/detail_image_screen.dart';
import 'package:contacts_app_mvvm/screens/gallery/gallery_screen.dart';
import 'package:contacts_app_mvvm/screens/gallery/gallery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
        ChangeNotifierProvider(create: (_) => GalleryViewModel()),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      routes: {
        RoutePaths.contact: (context) => const ContactScreen(),
        RoutePaths.gallery: (context) => const GalleryScreen(),
        RoutePaths.detailImage: (context) => const DetailImageScreen(),

      },
    );
  }
}