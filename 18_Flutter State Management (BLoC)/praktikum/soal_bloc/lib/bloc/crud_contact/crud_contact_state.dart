part of 'crud_contact_bloc.dart';

sealed class CrudContactState extends Equatable {
  final List<ContactModel> contactList;
  const CrudContactState({required this.contactList});
  
  @override
  List<Object> get props => [contactList];
}

final class CrudContactInitial extends CrudContactState {
  const CrudContactInitial({required super.contactList});
}

// Start Create State
final class CreateContactSuccess extends CrudContactState {
  const CreateContactSuccess({required super.contactList});
}
// End of Create State

// Start Update State
final class UpdateContactSuccess extends CrudContactState {
  const UpdateContactSuccess({required super.contactList});
}
// End of Update State

// Start Delete State
final class DeleteContactSuccess extends CrudContactState {
  const DeleteContactSuccess({required super.contactList});
}
// End of Delete State