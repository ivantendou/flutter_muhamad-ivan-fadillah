import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_storage/models/contact_model.dart';
import 'package:soal_storage/models/db_manager.dart';
import 'package:soal_storage/pages/contact/widgets/contact_form_header_widget.dart';
import 'package:soal_storage/pages/contact/widgets/contact_form_widget.dart';
import 'package:soal_storage/pages/contact/widgets/contact_list_item_widget.dart';
import 'package:soal_storage/pages/contact/widgets/profile_sheet.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  bool _isEditing = false;
  int? selectedContactid;
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.black;
  Color pickedColor = Colors.black;

  void onSubmit() {
    final contact = ContactModel(
      id: selectedContactid,
      name: _nameController.text,
      number: _numberController.text,
      date: selectedDate,
      color: selectedColor,
    );

    if (_formKey.currentState!.validate()) {
      if (_isEditing) {
        Provider.of<DbManager>(context, listen: false).updateContact(contact);
        _isEditing = false;
      } else {
        Provider.of<DbManager>(context, listen: false).addContact(contact);
      }
      _nameController.clear();
      _numberController.clear();
      selectedDate = DateTime.now();
      selectedColor = Colors.black;
      selectedContactid = null;
      setState(() {});
    }
  }

  void onEdit(int id) async {
    ContactModel contact =
        await Provider.of<DbManager>(context, listen: false).getContactById(id);
    selectedContactid = contact.id;
    _nameController.text = contact.name;
    _numberController.text = contact.number;
    selectedDate = contact.date;
    selectedColor = contact.color;
    setState(() {
      _isEditing = true;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contacts'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const ProfileSheet(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
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
                  nameController: _nameController,
                  numberController: _numberController,
                  onPressed: onSubmit,
                  isEditing: _isEditing,
                  selectedDate: selectedDate,
                  onDateSelected: (date) {
                    selectedDate = date;
                    setState(() {});
                  },
                  selectedColor: selectedColor,
                  onColorChanged: (color) {
                    pickedColor = color;
                  },
                  onCancelPressed: () {
                    Navigator.pop(context);
                  },
                  onSavePressed: () {
                    selectedColor = pickedColor;
                    Navigator.pop(context);
                    setState(() {});
                  },
                ),
                ContactListItemWidget(
                  onEditPressed: onEdit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
