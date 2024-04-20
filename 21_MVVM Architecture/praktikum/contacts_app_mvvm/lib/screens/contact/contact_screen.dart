import 'package:contacts_app_mvvm/constant/route_paths_contant.dart';
import 'package:contacts_app_mvvm/screens/contact/contact_view_model.dart';
import 'package:contacts_app_mvvm/screens/contact/widget/contact_form_header_widget.dart';
import 'package:contacts_app_mvvm/screens/contact/widget/contact_form_widget.dart';
import 'package:contacts_app_mvvm/screens/contact/widget/contact_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ContactFormHeaderWidget(),
                ContactFormWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      modelView.onSubmit();
                    }
                  },
                  nameController: modelView.nameController,
                  numberController: modelView.numberController,
                  nameValidator: modelView.validateName,
                  numberValidator: modelView.validatePhoneNumber,
                  isEditing: modelView.isEditing,
                  dueDate: modelView.dueDate,
                  currentDate: modelView.currentDate,
                  onDateSelected: (date) {
                    modelView.setDate(date);
                  },
                  selectedColor: modelView.selectedColor,
                  pickerColor: modelView.currentColor,
                  onColorChanged: (color) {
                    modelView.setColor(color);
                  },
                  onSavePressed: () {
                    modelView.saveSelectedColor();
                    Navigator.pop(context);
                  },
                  onCancelPressed: () {
                    Navigator.pop(context);
                  },
                  currentColor: modelView.currentColor,
                  pickFile: modelView.pickFile,
                  openFile: modelView.openFile,
                  selectedFile: modelView.selectedFile,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ContactListWidget(
                  contactList: modelView.contactList,
                  onEditPressed: modelView.editContact,
                  onDeletePressed: modelView.deleteContact,
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.gallery);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
