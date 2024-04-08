import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

part 'color_picker_event.dart';
part 'color_picker_state.dart';

class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBloc() : super(ColorPickerInitial()) {
    on<PickColorEvent>((event, emit) async {
      Color currentColor = Colors.black;

      await showDialog(
        barrierDismissible: false,
        context: event.context,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              title: const Text('Pick Your Color'),
              content: BlockPicker(
                pickerColor: currentColor,
                onColorChanged: ((color) {
                  currentColor = color;
                }),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    emit(PickedColorState(pickedColor: currentColor));
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      );
    });

    on<SetColorEvent>((event, emit) {
      emit(PickedColorState(pickedColor: event.newColor));
    });
  }
}
