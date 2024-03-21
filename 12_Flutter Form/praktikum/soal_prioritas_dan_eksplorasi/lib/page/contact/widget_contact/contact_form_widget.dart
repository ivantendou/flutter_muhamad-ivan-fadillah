import 'package:flutter/material.dart';
import 'package:soal_prioritas_dan_eksplorasi/widget/text_form_field_custom.dart';
import 'package:soal_prioritas_dan_eksplorasi/constant/color_constant.dart';

class ContactListWidget extends StatelessWidget {
  final void Function()? onPressed;
  final TextEditingController? nameController;
  final TextEditingController? numberController;
  final String? Function(String?)? nameValidator;
  final String? Function(String?)? numberValidator;
  final bool isEditing;

  const ContactListWidget({
    super.key,
    required this.onPressed,
    required this.nameController,
    required this.numberController,
    required this.nameValidator,
    required this.numberValidator,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
