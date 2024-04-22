import 'package:contacts_app_mvvm/screens/contact/contact_view_model.dart';
import 'package:contacts_app_mvvm/screens/contact/widget/contact_form_header_widget.dart';
import 'package:contacts_app_mvvm/screens/contact/widget/contact_form_widget.dart';
import 'package:contacts_app_mvvm/screens/contact/widget/contact_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contacts_app_mvvm/screens/contact/contact_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // Bukalah tugas (@11. Soal Form & Advance Form Input  ). Lakukan Test seluruh
  // halaman yang pernah dibuat pada bagian judul, body, dan seluruh elemen yang
  // ada pada halaman tersebut.
  testWidgets('ContactScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<ContactViewModel>(
          create: (_) => ContactViewModel(),
          child: const ContactScreen(),
        ),
      ),
    );
    expect(find.text('Contacts'), findsOneWidget);

    expect(find.byType(ContactFormWidget), findsOneWidget);

    expect(find.byType(ContactListWidget), findsOneWidget);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Contact'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
  });

  testWidgets('Contact Form Header UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<ContactViewModel>(
          create: (_) => ContactViewModel(),
          child: const ContactScreen(),
        ),
      ),
    );

    expect(find.byType(ContactFormHeaderWidget), findsOneWidget);
    expect(find.byIcon(Icons.person_add), findsOneWidget);
    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(
      find.text(
          'Fill in the fields below to add a new contact. Ensure to provide the full name and a valid phone number before submitting.'),
      findsOneWidget,
    );
    const TextStyle titleTextStyle =
        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400);
    const TextStyle descriptionTextStyle =
        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400);
    final titleTextWidget =
        tester.widget<Text>(find.text('Create New Contacts'));
    expect(titleTextWidget.style?.fontSize, titleTextStyle.fontSize);
    expect(titleTextWidget.style?.fontWeight, titleTextStyle.fontWeight);
    final descriptionTextWidget = tester.widget<Text>(find.text(
        'Fill in the fields below to add a new contact. Ensure to provide the full name and a valid phone number before submitting.'));
    expect(
        descriptionTextWidget.style?.fontSize, descriptionTextStyle.fontSize);
    expect(descriptionTextWidget.style?.fontWeight,
        descriptionTextStyle.fontWeight);
    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('Contact Form Header UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider<ContactViewModel>(
            create: (_) => ContactViewModel(),
            child: ContactFormWidget(
              onPressed: null,
              nameController: null, 
              numberController: null,
              nameValidator: (value) => null,
              numberValidator: (value) => null,
              isEditing: false,
              dueDate: DateTime.now(),
              currentDate: DateTime.now(),
              onDateSelected: (date) {},
              selectedColor: Colors.blue,
              pickerColor: Colors.blue,
              onColorChanged: (color) {},
              onSavePressed: () {},
              onCancelPressed: () {},
              currentColor: Colors.white,
              pickFile: () {},
              openFile: (file) {},
              selectedFile: null,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();
    expect(find.text('OK'), findsOneWidget);
    await tester.tap(find.text('Pick Color'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pick and Open File'));
    await tester.pumpAndSettle();
    expect(find.text('File: No file selected'), findsOneWidget);
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();
  });

  testWidgets('Contact Form Header UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<ContactViewModel>(
          create: (_) => ContactViewModel(),
          child: const ContactScreen(),
        ),
      ),
    );
  });
}
