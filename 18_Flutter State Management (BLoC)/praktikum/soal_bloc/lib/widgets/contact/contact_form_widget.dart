import 'package:flutter/material.dart';
import 'package:soal_bloc/utils/constant/text_input_validator.dart';
import 'package:soal_bloc/widgets/contact/color_picker_widget.dart';
import 'package:soal_bloc/widgets/contact/date_picker_widget.dart';
import 'package:soal_bloc/widgets/contact/filel_picker_widget.dart';
import '../../utils/constant/color_constant.dart';
import '../common/text_form_field_widget.dart';

class ContactForm extends StatelessWidget {
  final Key? formKey;
  final TextEditingController? nameController;
  final TextEditingController? numberController;
  final void Function()? onPressed;
  final bool isEditing;
  const ContactForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.numberController,
    required this.onPressed,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          const DatePickerWidget(),
          const SizedBox(
            height: 16.0,
          ),
          const ColorPickerWidget(),
          const SizedBox(
            height: 16.0,
          ),
          const FilePickerWidget(),
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
      ),
    );
  }
}
