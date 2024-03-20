import 'package:flutter/material.dart';
import 'package:soal_prioritas_dan_eksplorasi/page/contact/widget_contact/contact_form_header.dart';
import 'package:soal_prioritas_dan_eksplorasi/widget/text_form_field_custom.dart';
import 'package:soal_prioritas_dan_eksplorasi/constant/color_constant.dart';

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
                TextFormFieldCustom(
                  controller: nameController,
                  labelText: 'Name',
                  hintText: 'Insert Your Name',
                  validator: validateName,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormFieldCustom(
                  controller: numberController,
                  isValidInputForPhone: true,
                  labelText: 'Number',
                  hintText: '+62 ...',
                  keyboardType: true,
                  validator: validatePhoneNumber,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ColorConstant.backgroundColor,
                      ),
                    ),
                    onPressed: onSubmit,
                    child: Text(
                      isEditing ? 'Edit' : 'Submit',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'List Contacts',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                contactList.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24.0,
                            ),
                            Icon(
                              Icons.contact_emergency,
                              size: 24,
                            ),
                            Text('Empty contact'),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: contactList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                child: Text(contactList[index].name[0]),
                              ),
                              title: Text(
                                contactList[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(contactList[index].number),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      editContact(index);
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        contactList.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
