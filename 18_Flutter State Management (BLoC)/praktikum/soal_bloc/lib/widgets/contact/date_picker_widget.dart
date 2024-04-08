import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:soal_bloc/bloc/date_picker/date_picker_bloc.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DatePickerBloc, DatePickerState>(
          builder: (context, state) {
            DateTime selectedDateTime = DateTime.now();

            if (state is DatePickerSelected) {
              selectedDateTime = state.selectedDate;
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date'),
                TextButton(
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    context.read<DatePickerBloc>().add(OpenDatePicker(
                          context: context,
                          selectedDateTime: selectedDateTime,
                        ));
                  },
                ),
              ],
            );
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<DatePickerBloc, DatePickerState>(
            builder: (context, state) {
              if (state is DatePickerSelected) {
                return Text(
                    DateFormat('dd-MM-yyyy').format(state.selectedDate));
              } else {
                return Text(DateFormat('dd-MM-yyyy').format(DateTime.now()));
              }
            },
          ),
        ),
      ],
    );
  }
}
