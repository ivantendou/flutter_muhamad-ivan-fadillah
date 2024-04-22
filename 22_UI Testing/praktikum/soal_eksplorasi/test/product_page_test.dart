import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laptopshop_provider_app/models/cart_manager.dart';
import 'package:laptopshop_provider_app/screens/product_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('ProductPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider(
            create: (_) => CartManager(),
            child: const ProductPage(),
          ),
        ),
      ),
    );

    expect(find.text('Laptop Shop'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_rounded), findsOneWidget);
  });
}
