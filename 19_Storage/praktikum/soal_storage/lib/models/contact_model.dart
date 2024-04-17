import 'dart:ui';

class ContactModel {
  late int? id;
  late String name;
  late String number;
  late DateTime date;
  late Color color;

  ContactModel({
    this.id,
    required this.name,
    required this.number,
    required this.date,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'date': date.toIso8601String(),
      'color': color.value,
    };
  }

  ContactModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    number = map['number'];
    date = DateTime.parse(map['date']);
    color = Color(map['color']);
  }
}
