import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final bool keyboardType;
  final bool isValidInputForPhone;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  const TextFormFieldCustom({
    super.key,
    required this.labelText,
    this.hintText,
    this.keyboardType = false,
    this.isValidInputForPhone = false,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [
        if (isValidInputForPhone) ...[
          FilteringTextInputFormatter.digitsOnly,
        ],
      ],
      keyboardType: keyboardType ? TextInputType.phone : null,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}
