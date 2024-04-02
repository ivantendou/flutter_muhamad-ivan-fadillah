import 'package:flutter/material.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/constant/route_paths_cosntant.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/contact/contact_form_header_widget.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/contact/contact_form_widget.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/contact/contact_list_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/contact/contact_provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
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
            key: contactProvider.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ContactFormHeader(),
                ContactListWidget(
                  onPressed: contactProvider.onSubmit,
                  nameController: contactProvider.nameController,
                  numberController: contactProvider.numberController,
                  nameValidator: contactProvider.validateName,
                  numberValidator: contactProvider.validatePhoneNumber,
                  isEditing: contactProvider.isEditing,
                  dueDate: contactProvider.dueDate,
                  currentDate: contactProvider.currentDate,
                  onDateSelected: (date) {
                    contactProvider.setDate(date);
                  },
                  selectedColor: contactProvider.selectedColor,
                  pickerColor: contactProvider.currentColor,
                  onColorChanged: (color) {
                    contactProvider.setColor(color);
                  },
                  onSavePressed: () {
                    contactProvider.saveSelectedColor();
                    Navigator.pop(context);
                  },
                  onCancelPressed: () {
                    Navigator.pop(context);
                  },
                  currentColor: contactProvider.currentColor,
                  pickFile: contactProvider.pickFile,
                  openFile: contactProvider.openFile,
                  selectedFile: contactProvider.selectedFile,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ContactListItem(
                  contactList: contactProvider.contactList,
                  onEditPressed: contactProvider.editContact,
                  onDeletePressed: contactProvider.deleteContact,
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
