# (13) Advance Form Input

1. Pada materi Advance Form Input, kita mempelajari penggunaan yang lebih canggih untuk form, di materi ini kita tidak menginput teks biasa, namun kita memanfaatkan library-library yang digunakan untuk menginput hal lain seperti tanggal, warna, dan file. Yang pertama kita bisa menggunakan Date Picker untuk input tanggal. Widget ini akan mengizinkan user untuk memasukkan tanggal. Ini bermanfaat di real case, misalnya ketika membutuhkan input waktu pemesanan tiken, waktu reservasi restoran, jadwal meeting, dll. Untuk menggunakan Date Picker kita perlu menambahkan pakages intl di pubspec.yaml. (intl: ^0.19.0). Berikut adalah basic code untuk Date Picker:
```dart
final selectDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(1990),
    lastDate: DateTime(currentDate.year + 5),
)
```

2. Kemudian ada Color Picker yang membuat user bisa memilih warna (color). Pertama, kita perlu menambahkan package flutter_colorpicker di pubspec.yaml (flutter_colorpicker: ^1.0.3). Untuk menggunakannya kita bisa menggunakan BlockPicker. Berikut contoh implementasi BlockPicker di AlertDialog.
```dart
return AlertDialog(
    title: const Text('Pick Your Color'),
    content: BlockPicker(
        pickerColor: _currentColor,
        onColorChanged: (color) {
            setState({
                _currentColor = color;
            });
        },
    ),
),
```

3. Untuk menginput file dan agar bisa mengakses storage lalu memilih dan membuka file kita bisa menggunakan FilePicker. Package yang perlu ditambahkan adalah file_picker: ^8.0.0+1 dan open_filex: ^4.4.0. Kita bisa membuat fungsi untuk membuka dan memilih file seperti implementasi berikut:
```dart
// fungsi untuk membuka file yang telah dipilih
void openFile(PlatformFile file) {
    OpenFile.open(file.path);
}

// fungsi untuk mengambil file dari storage
void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    openFile(file);
}
```