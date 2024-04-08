part of 'file_picker_bloc.dart';

sealed class FilePickerEvent extends Equatable {
  const FilePickerEvent();
}

class PickFileEvent extends FilePickerEvent {
  const PickFileEvent();

  @override
  List<Object> get props => [];
}

class SetFileEvent extends FilePickerEvent {
  final PlatformFile? newFile;

  const SetFileEvent({required this.newFile});

  @override
  List<Object?> get props => [newFile];
}