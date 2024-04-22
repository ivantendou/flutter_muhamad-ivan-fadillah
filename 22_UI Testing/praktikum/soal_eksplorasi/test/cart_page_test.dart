import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laptopshop_provider_app/models/cart_manager.dart';
import 'package:laptopshop_provider_app/screens/cart_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('CartPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => CartManager(),
          child: const CartPage(),
        ),
      ),
    );

    expect(find.text('Cart Page'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Buy'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    await tester.tap(find.widgetWithText(ElevatedButton, 'Buy'));
    await tester.pump();
  });
}
