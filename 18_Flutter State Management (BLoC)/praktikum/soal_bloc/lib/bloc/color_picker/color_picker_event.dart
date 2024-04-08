part of 'color_picker_bloc.dart';

sealed class ColorPickerEvent extends Equatable {
  const ColorPickerEvent();
}

class PickColorEvent extends ColorPickerEvent {
  final BuildContext context;

  const PickColorEvent({required this.context});

  @override
  List<Object> get props => [context];
}

class SetColorEvent extends ColorPickerEvent {
  final Color newColor;

  const SetColorEvent({required this.newColor});

  @override
  List<Object> get props => [newColor];
}