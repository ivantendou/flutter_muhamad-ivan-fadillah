# (17) Flutter State Management (Provider)

1. *State* atau keadaan atau kondisi adalah data yang dapat dibaca saat pembuatan widget, ia dapat berubah saat widget sedang aktif. Ini hanya dimiliki oleh StatefullWidget. Kita dapat memanfaatkan state dengan cara membuat variabel penampung sebagai property dari class, lalu digunakan pada widget saat build. Agar widget bisa berubah secara realtime kita gunakan fungsi setState. Tapi bukankah merepoktan jika harus membuat state baru berulang kali, kemudian harus menggunakan setState berulang kali? Untuk itu Global State adalah solusi agar widget dapat memanfaatkan state yang sama dengan mudah. Provider hadir sebagai state management untuk mengatasi masalah ini.

2. Untuk menggunakan provider, pertama-tama kita harus tambah package provider di dependencies. Selanjutnya kita dapat memanfaatkan class-class dari provider seperti ChangeNotifierProvider, MultiProvider, dan Consumer. Untuk membuat file provider kita menggunakan class yang extends ChangeNotifier yang mana itu adalah built in class dari Flutter SDK.

3. MultiProvider adalah provider yang digunakan untuk menggabungkan beberapa provider menjadi satu. Di dalam MultiProvider kita menambahkan ChangeNotifierProvider yang digunakan untuk menyediakan 'ChangeNotifier' kepada bagian yang membutuhkannya.
```dart
MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => contact_provider.ContactProvider()),
        ChangeNotifierProvider(create: (_) => gallery_provider.GalleryProvider()),
      ],
      child: const MyApp(),
    ),
```
Lalu ada Consumer yang bisa kita gunakan untuk membatasi pembaruan hanya pada bagian-bagian yang benar-benar membutuhkannya. Jadi kita ga perlu memberikan Provider.of<T>(context) karena belum tentu seluruh bagian widget memerlukannya.
```dart
Consumer<MyGlobalModel>(
  builder: (context, myGlobalModel, child) {
    // Widget yang bergantung pada myGlobalModel
    return Text(myGlobalModel.someValue);
  },
)
```
Terakhir ada ChangeNotifier yang kita extends saat membuat file provider-nya. ChangeNotifier memungkinkan objek untuk memberi tahu widget saat ada perubahan pada data yang dimilikinya.