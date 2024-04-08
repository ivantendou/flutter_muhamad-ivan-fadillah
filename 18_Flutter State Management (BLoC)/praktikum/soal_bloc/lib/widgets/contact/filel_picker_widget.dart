import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/bloc_barrel.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Pick Files',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        BlocBuilder<ColorPickerBloc, ColorPickerState>(
          builder: (context, state) {
            return Center(
              child: ElevatedButton(
                child: const Text('Pick and Open File'),
                onPressed: () {
                  context.read<FilePickerBloc>().add(const PickFileEvent());
                },
              ),
            );
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        BlocBuilder<FilePickerBloc, FilePickerState>(
          builder: (context, state) {
            PlatformFile? selectedFile;

            if (state is PickedFileState) {
              selectedFile = state.selectedFile;
            }

            return Text('File: ${selectedFile?.name ?? "No file selected"}');
          },
        ),
      ],
    );
  }
}
