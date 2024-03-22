import 'package:flutter/material.dart';
import 'package:soal_prioritas_dan_eksplorasi/page/contact/widget_contact/contact_form_header_widget.dart';
import 'package:soal_prioritas_dan_eksplorasi/page/contact/widget_contact/contact_form_widget.dart';
import 'package:soal_prioritas_dan_eksplorasi/page/contact/widget_contact/contact_list_item_widget..dart';

class ContactModel {
  final String name;
  final String number;

  ContactModel({
    required this.name,
    required this.number,
  });
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<ContactModel> contactList = [];
  bool isEditing = false;
  int editingIndex = -1;

  void editContact(int index) {
    setState(() {
      nameController.text = contactList[index].name;
      numberController.text = contactList[index].number;
      isEditing = true;
      editingIndex = index;
    });
  }

  void deleteContact(int index) {
    setState(() {
      contactList.removeAt(index);
    });
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      if (isEditing) {
        contactList[editingIndex] = ContactModel(
          name: nameController.text,
          number: numberController.text,
        );
        isEditing = false;
        editingIndex = -1;
      } else {
        contactList.add(
          ContactModel(
            name: nameController.text,
            number: numberController.text,
          ),
        );
      }

      nameController.clear();
      numberController.clear();
      setState(() {});

      print("Contact List:");
      for (var contact in contactList) {
        print("Name: ${contact.name}, Number: ${contact.number}");
      }
    }
  }

  String? validateName(String? value) {
    if (value?.isEmpty == true) {
      return 'Name must not be empty.';
    } else if ((value?.length ?? 0) < 2) {
      return 'The name must consist of at least 2 words.';
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value!)) {
      return 'Name should not contain special characters or numbers.';
    } else if (!RegExp(r'^[A-Z][a-z]*([\s-][A-Z][a-z]*)*$').hasMatch(value)) {
      return 'Each word should start with a capital letter.';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value?.isEmpty == true) {
      return 'Number must not be empty.';
    } else if (!RegExp(r'^0').hasMatch(value!)) {
      return 'Phone number must start with 0.';
    } else if (value.length < 8) {
      return 'The phone number must be a minimum of 8 digits long.';
    } else if (value.length > 15) {
      return 'The phone number must be a maximum of 15 digits long.';
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                const ContactFormHeader(),
                ContactListWidget(
                  onPressed: onSubmit,
                  nameController: nameController,
                  numberController: numberController,
                  nameValidator: validateName,
                  numberValidator: validatePhoneNumber,
                  isEditing: isEditing,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ContactListItem(
                  contactList: contactList,
                  onEditPressed: editContact,
                  onDeletePressed: deleteContact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
