import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/color_picker/color_picker_bloc.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ColorPickerBloc, ColorPickerState>(
          builder: (context, state) {
            Color pickedColor = Colors.black;

            if (state is PickedColorState) {
              pickedColor = state.pickedColor;
            }

            return Container(
              height: 100,
              width: double.infinity,
              color: pickedColor,
            );
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        BlocBuilder<ColorPickerBloc, ColorPickerState>(
          builder: (context, state) {
            Color pickedColor = Colors.black;

            if (state is PickedColorState) {
              pickedColor = state.pickedColor;
            }
            
            return ElevatedButton(
              onPressed: () {
                context
                    .read<ColorPickerBloc>()
                    .add(PickColorEvent(context: context));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(pickedColor),
              ),
              child: const Text(
                'Pick Color',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
