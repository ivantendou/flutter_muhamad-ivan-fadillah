import 'package:flutter/material.dart';
import 'package:code_competence_1/constant/color_constant.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? labelText;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const TextFormFieldCustom({
    super.key,
    required this.labelText,
    this.maxLines,
    required this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontSize: 24,
          color: ColorConstant().primaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: ColorConstant().primaryColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
    );
  }
}
