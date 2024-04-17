# (19) Storage

1. Beberapa cara untuk implementasi penyimpanan lokal di aplisi mobile diantaranya ialah SharedPreferences dan Local Database(misal SQflite). SharedPreferences adalah mekanisme penyimpanan data yang sederhana dengan format (key-value). Digunakan untuk menyimpan data kecil seperti preferensi pengguna atau riwayat pencarian. Sedangkan, Local database adalah jenis database yang disimpan dan diakses secara lokal pada perangkat atau komputer tertentu, biasanya tidak memerlukan koneksi internet untuk mengaksesnya. Bedanya dengan SharedPreferences, pada Local database kita bisa menyimpan lebih banyak tipe data, dan lebih banyak ukuran data.

2. Untuk menggunakan `SharedPreferences` dalam Flutter, kita perlu menggunakan paket `shared_preferences`. 
```yaml
dependencies:
  shared_preferences: ^2.0.0
```
Kemudian kita import package di file Dart,
```dart
import 'package:shared_preferences/shared_preferences.dart';
```
Untuk menyimpan data, lalukan seperti ini:
```dart
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('key_name', 'Ivan');
```
Lalu untuk mengambil data kita bisa lakukan seperti ini:
```dart
SharedPreferences prefs = await SharedPreferences.getInstance();
String stringValue = prefs.getString('key_name');
```

3. SQLite dapat meyimpan dan meminta data dalam jumlah besar pada *local device*, SQLite bersifat privat, kita bisa menggunakan SQLite database melalui package sqflite. SQLite adalah database open source yang mendukung INSERT, READ, UPDATE, dan REMOVE data.