import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/bloc_barrel.dart';
import 'package:soal_bloc/widgets/contact/contact_form_header_widget.dart';
import 'package:soal_bloc/widgets/contact/contact_form_widget.dart';
import 'package:soal_bloc/widgets/contact/contact_list_item_widget.dart';

import '../utils/constant/route_paths_cosntant.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int selectedIndex = -1;
  bool isEditing = false;

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final crudContactBloc = context.read<CrudContactBloc>();
    final datePickerBloc = context.read<DatePickerBloc>();
    final colorPickerBloc = context.read<ColorPickerBloc>();
    final filePickerBloc = context.read<FilePickerBloc>();
    final currentDatePickerState = context.watch<DatePickerBloc>().state;
    final currentColorPickerState = context.watch<ColorPickerBloc>().state;
    final currentFilePickerState = context.watch<FilePickerBloc>().state;
    DateTime dateTime = currentDatePickerState is DatePickerSelected
        ? currentDatePickerState.selectedDate
        : DateTime.now();
    Color selectedColor = currentColorPickerState is PickedColorState
        ? currentColorPickerState.pickedColor
        : Colors.black;
    PlatformFile? selectedFile = currentFilePickerState is PickedFileState
    ? currentFilePickerState.selectedFile : null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ContactFormHeader(),
              ContactForm(
                formKey: _formKey,
                nameController: nameController,
                numberController: numberController,
                onPressed: () {
                  if (selectedIndex == -1) {
                    if (_formKey.currentState!.validate()) {
                      crudContactBloc.add(
                        CreateContactEvent(
                          name: nameController.text,
                          number: numberController.text,
                          date: dateTime,
                          color: selectedColor,
                          file: selectedFile,
                        ),
                      );
                      nameController.clear();
                      numberController.clear();
                      datePickerBloc.add(
                        SetDatePicked(selectedDateTime: DateTime.now()),
                      );
                      colorPickerBloc.add(
                        const SetColorEvent(newColor: Colors.black),
                      );
                      filePickerBloc.add(
                        const SetFileEvent(newFile: null),
                      );
                    }
                  } else {
                    crudContactBloc.add(
                      UpdateContactEvent(
                        name: nameController.text,
                        number: numberController.text,
                        date: dateTime,
                        color: selectedColor,
                        file: selectedFile,
                        index: selectedIndex,
                      ),
                    );
                    nameController.clear();
                    numberController.clear();
                    datePickerBloc.add(
                      SetDatePicked(selectedDateTime: DateTime.now()),
                    );
                    colorPickerBloc.add(
                      const SetColorEvent(newColor: Colors.black),
                    );
                    filePickerBloc.add(
                        SetFileEvent(newFile: selectedFile),
                      );
                    selectedIndex = -1;
                    isEditing = false;
                    setState(() {});
                  }
                },
                isEditing: isEditing,
              ),
              ContactListItem(
                onEditPressed: (
                  int index,
                  String name,
                  String number,
                  DateTime date,
                  Color color,
                  PlatformFile? file,
                  bool isEditingUpdate,
                ) {
                  setState(() {
                    selectedIndex = index;
                    nameController.text = name;
                    numberController.text = number;
                    dateTime = date;
                    selectedColor = color;
                    selectedFile = file;
                    isEditing = isEditingUpdate;
                  });
                },
                onDeletePressed: (int index) {
                  crudContactBloc.add(DeleteContactEvent(index: index));
                  setState(() {
                    nameController.clear();
                    numberController.clear();
                    isEditing = false;
                  });
                },
              ),
            ],
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
