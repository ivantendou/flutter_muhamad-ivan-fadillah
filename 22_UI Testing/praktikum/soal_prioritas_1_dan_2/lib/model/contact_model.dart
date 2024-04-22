import 'dart:ui';

import 'package:file_picker/file_picker.dart';

class ContactModel {
  final String name;
  final String number;
  final DateTime date;
  final Color color;
  final PlatformFile? file;

  ContactModel({
    required this.name,
    required this.number,
    required this.date,
    required this.color,
    this.file,
  });
}