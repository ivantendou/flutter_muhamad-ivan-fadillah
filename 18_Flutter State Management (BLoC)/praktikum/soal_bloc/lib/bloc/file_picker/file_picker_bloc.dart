import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';

part 'file_picker_event.dart';
part 'file_picker_state.dart';

class FilePickerBloc extends Bloc<FilePickerEvent, FilePickerState> {
  FilePickerBloc() : super(FilePickerInitial()) {
    on<PickFileEvent>((event, emit) async {
      final result = await FilePicker.platform.pickFiles();
      if (result == null) return;
      final file = result.files.first;
      emit(PickedFileState(selectedFile: file));
      OpenFilex.open(file.path);
    });

    on<SetFileEvent>((event, emit) {
      emit(PickedFileState(selectedFile: event.newFile));
    });
  }
}
