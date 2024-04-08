import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:soal_bloc/models/contact_model.dart';

part 'crud_contact_event.dart';
part 'crud_contact_state.dart';

class CrudContactBloc extends Bloc<CrudContactEvent, CrudContactState> {
  CrudContactBloc() : super(const CrudContactInitial(contactList: [])) {
    on<CreateContactEvent>((event, emit) {
      List<ContactModel> contactList = List.from(state.contactList);

      contactList.add(
        ContactModel(
          name: event.name,
          number: event.number,
          date: event.date,
          color: event.color,
          file: event.file,
        ),
      );

      emit(CreateContactSuccess(contactList: contactList));
    });

    on<UpdateContactEvent>((event, emit) {
      List<ContactModel> contactListAfterUpdate = List.from(state.contactList);

      contactListAfterUpdate[event.index] = ContactModel(
        name: event.name,
        number: event.number,
        date: event.date,
        color: event.color,
        file: event.file,
      );

      emit(UpdateContactSuccess(contactList: contactListAfterUpdate));
    });

    on<DeleteContactEvent>((event, emit) {
      List<ContactModel> contactListAfterDelete = List.from(state.contactList);

      contactListAfterDelete.removeAt(event.index);

      emit(DeleteContactSuccess(contactList: contactListAfterDelete));
    });
  }
}
