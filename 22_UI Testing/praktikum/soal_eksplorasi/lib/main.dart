import 'package:flutter/material.dart';
import 'package:laptopshop_provider_app/screens/product_page.dart';
import 'package:provider/provider.dart';
import 'package:laptopshop_provider_app/models/cart_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Cart',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const ProductPage(),
      ),
    );
  }
}
