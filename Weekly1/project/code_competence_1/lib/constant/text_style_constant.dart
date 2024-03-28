import 'package:flutter/material.dart';
import 'package:code_competence_1/constant/color_constant.dart';

class TextStyleConstant {
  static TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorConstant().primaryColor,
  );

  static TextStyle subtitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorConstant().primaryColor,
  );

  static TextStyle contentStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorConstant().primaryColor,
  );
}
