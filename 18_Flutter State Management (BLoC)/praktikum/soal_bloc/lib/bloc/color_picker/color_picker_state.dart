part of 'color_picker_bloc.dart';

sealed class ColorPickerState extends Equatable {
  const ColorPickerState();
}

final class ColorPickerInitial extends ColorPickerState {
  @override
  List<Object> get props => [];
}

final class PickedColorState extends ColorPickerState {
  final Color pickedColor;

  const PickedColorState({required this.pickedColor});

  @override
  List<Object> get props => [pickedColor];
}