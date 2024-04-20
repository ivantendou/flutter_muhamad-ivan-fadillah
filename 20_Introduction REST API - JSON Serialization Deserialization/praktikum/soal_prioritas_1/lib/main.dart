import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas_1/constant/route_paths_constant.dart';
import 'package:soal_prioritas_1/page/get_api/get_page.dart';
import 'package:soal_prioritas_1/page/post_api/post_page.dart';
import 'package:soal_prioritas_1/page/put_api/put_page.dart';
import 'package:soal_prioritas_1/page/post_api/post_provider.dart' as post_provider;
import 'package:soal_prioritas_1/page/put_api/put_provider.dart' as put_provider;
import 'package:soal_prioritas_1/page/get_api/get_provider.dart' as get_provider;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => post_provider.PostProvider()),
        ChangeNotifierProvider(create: (_) => put_provider.PutProvider()),
        ChangeNotifierProvider(create: (_) => get_provider.GetProvider()),
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
      title: 'Latihan REST API',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Colors.indigo),
        ),
      ),
      routes: {
        RoutePaths.post: (context) => const PostPage(),
        RoutePaths.put: (context) => const PutPage(),
        RoutePaths.getPage: (context) => const GetPage(),
      },
    );
  }
}
