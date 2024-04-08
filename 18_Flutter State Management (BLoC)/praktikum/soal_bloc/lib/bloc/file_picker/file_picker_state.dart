part of 'file_picker_bloc.dart';

sealed class FilePickerState extends Equatable {
  const FilePickerState();
}

final class FilePickerInitial extends FilePickerState {
  @override
  List<Object?> get props => [];
}

final class PickedFileState extends FilePickerState {
  final PlatformFile? selectedFile;

  const PickedFileState({required this.selectedFile});
    
  @override
  List<Object?> get props => [selectedFile];
}
