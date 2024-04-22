import 'package:contacts_app_mvvm/constant/color_constant.dart';
import 'package:contacts_app_mvvm/screens/contact/widget/text_form_field_custom.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class ContactFormWidget extends StatelessWidget {
  final void Function()? onPressed;
  final TextEditingController? nameController;
  final TextEditingController? numberController;
  final String? Function(String?)? nameValidator;
  final String? Function(String?)? numberValidator;
  final bool isEditing;
  final DateTime dueDate;
  final DateTime currentDate;
  final void Function(DateTime) onDateSelected;
  final Color? selectedColor;
  final Color pickerColor;
  final void Function(Color) onColorChanged;
  final void Function()? onSavePressed;
  final void Function()? onCancelPressed;
  final Color currentColor;
  final void Function() pickFile;
  final void Function(PlatformFile) openFile;
  final PlatformFile? selectedFile;
  const ContactFormWidget({
    super.key,
    required this.onPressed,
    required this.nameController,
    required this.numberController,
    required this.nameValidator,
    required this.numberValidator,
    required this.isEditing,
    required this.dueDate,
    required this.currentDate,
    required this.onDateSelected,
    required this.selectedColor,
    required this.pickerColor,
    required this.onColorChanged,
    required this.onSavePressed,
    required this.onCancelPressed,
    required this.currentColor,
    required this.pickFile,
    required this.openFile,
    this.selectedFile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormFieldCustom(
          controller: nameController,
          labelText: 'Name',
          hintText: 'Insert Your Name',
          validator: nameValidator,
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
          validator: numberValidator,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Date',
            ),
            TextButton(
              child: const Text(
                'Select',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: dueDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );

                if (selectDate != null) {
                  onDateSelected(selectDate);
                }
              },
            )
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat('dd-MM-yyyy').format(dueDate),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: selectedColor,
        ),
        const SizedBox(
          height: 10.0,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return PopScope(
                  canPop: false,
                  child: AlertDialog(
                    title: const Text('Pick Your Color'),
                    content: BlockPicker(
                      pickerColor: pickerColor,
                      onColorChanged: onColorChanged,
                    ),
                    actions: [
                      TextButton(
                        onPressed: onCancelPressed,
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: onSavePressed,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(selectedColor),
          ),
          child: const Text(
            'Pick Color',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Pick Files',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Center(
          child: ElevatedButton(
            child: const Text('Pick and Open File'),
            onPressed: () {
              pickFile();
            },
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text('File: ${selectedFile?.name ?? "No file selected"}'),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                ColorConstant.backgroundColor,
              ),
            ),
            onPressed: onPressed,
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
      ],
    );
  }
}
