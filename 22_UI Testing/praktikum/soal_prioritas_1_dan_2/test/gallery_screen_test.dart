import 'package:contacts_app_mvvm/screens/gallery/gallery_screen.dart';
import 'package:contacts_app_mvvm/screens/gallery/gallery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  // SOAL PRIORITAS 2 - Lakukan testing UI pada halaman yang belum pernah dibuat!
  testWidgets('GalleryScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<GalleryViewModel>(
          create: (_) => GalleryViewModel(),
          child: const GalleryScreen(),
        ),
      ),
    );

    expect(find.text('Gallery'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();
    expect(find.byType(Column), findsOneWidget);
    expect(find.text('Gambar 1'), findsOneWidget);
  });
}
