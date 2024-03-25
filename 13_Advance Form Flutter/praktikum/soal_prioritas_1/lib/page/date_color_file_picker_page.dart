import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';

class DateAndColorPickerPage extends StatefulWidget {
  final String apptitle;
  const DateAndColorPickerPage({
    super.key,
    required this.apptitle,
  });

  @override
  State<StatefulWidget> createState() => _DateAndColorPickerState();
}

class _DateAndColorPickerState extends State<DateAndColorPickerPage> {
  DateTime dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color currentColor = Colors.orange;
  Color selectedColor = Colors.orange;
  PlatformFile? selectedFile;

  void openFile(PlatformFile file) {
    OpenFilex.open(file.path);
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      selectedFile = file;
    });
    openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.apptitle,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date',
                ),
                TextButton(
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () async {
                    final selectDate = await showDatePicker(
                      context: context,
                      initialDate: dueDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5),
                    );

                    setState(() {
                      if (selectDate != null) {
                        dueDate = selectDate;
                      }
                    });
                  },
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                DateFormat('dd-MM-yyyy').format(dueDate),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: selectedColor,
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return PopScope(
                      canPop: false,
                      child: AlertDialog(
                        title: const Text('Pick Your Color'),
                        content: BlockPicker(
                          pickerColor: currentColor,
                          onColorChanged: (color) {
                            currentColor = color;
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              selectedColor = currentColor;
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(currentColor),
              ),
              child: const Text(
                'Pick Color',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pick Files',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Pick and Open File'),
                onPressed: () {
                  pickFile();
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text('File: ${selectedFile?.name ?? "No file selected"}'),
          ],
        ),
      ),
    );
  }
}
