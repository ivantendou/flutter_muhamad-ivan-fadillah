import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:soal_storage/utils/constant/color_constant.dart';
import 'package:soal_storage/widgets/text_form_field_custom.dart';

class ContactFormWidget extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? numberController;
  final void Function()? onPressed;
  final bool isEditing;
  final DateTime selectedDate;
  final void Function(DateTime date) onDateSelected;
  final Color selectedColor;
  final void Function(Color) onColorChanged;
  final void Function()? onCancelPressed;
  final void Function()? onSavePressed;
  const ContactFormWidget({
    super.key,
    required this.nameController,
    required this.numberController,
    required this.onPressed,
    required this.isEditing,
    required this.selectedDate,
    required this.onDateSelected,
    required this.selectedColor,
    required this.onColorChanged,
    required this.onCancelPressed,
    required this.onSavePressed,
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
          validator: (value) {
            if (value?.isEmpty == true) {
              return 'Name must not be empty.';
            } else if ((value?.length ?? 0) < 2) {
              return 'The name must consist of at least 2 words.';
            } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                .hasMatch(value!)) {
              return 'Name should not contain special characters or numbers.';
            } else if (!RegExp(r'^[A-Z][a-z]*([\s-][A-Z][a-z]*)*$')
                .hasMatch(value)) {
              return 'Each word should start with a capital letter.';
            }
            return null;
          },
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
          validator: (value) {
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
          },
        ),
        const SizedBox(
          height: 16.0,
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
                final currentDate = DateTime.now();

                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
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
            DateFormat('dd-MM-yyyy').format(selectedDate),
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
                      pickerColor: selectedColor,
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
