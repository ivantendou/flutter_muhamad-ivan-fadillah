part of 'crud_contact_bloc.dart';

sealed class CrudContactEvent extends Equatable {
  const CrudContactEvent();
}

class CreateContactEvent extends CrudContactEvent {
  final String name;
  final String number;
  final DateTime date;
  final Color color;
  final PlatformFile? file;

  const CreateContactEvent({
    required this.name,
    required this.number,
    required this.date,
    required this.color,
    required this.file,
  });

  @override
  List<Object?> get props => [name, number, date, color, file];
}

class UpdateContactEvent extends CrudContactEvent {
  final String name;
  final String number;
  final DateTime date;
  final Color color;
  final PlatformFile? file;
  final int index;

  const UpdateContactEvent({
    required this.name,
    required this.number,
    required this.date,
    required this.color,
    required this.file,
    required this.index,
  });

  @override
  List<Object?> get props => [name, number, date, color, file, index];
}

class DeleteContactEvent extends CrudContactEvent {
  final int index;

  const DeleteContactEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
