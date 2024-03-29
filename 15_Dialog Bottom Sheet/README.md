# (15) Dialog Bottom Sheet

1. AlertDialog adalah sebuah widget yang muncul untuk menginformasikan pengguna tentang situasi tertentu. AlertDialog memiliki parameter seperti title untuk judul, content untuk isinya, action untuk button-button. Kita bisa menggunakan AlertDialog untuk mendapatkan input dari user. Untuk menampilkan AlertDialog kita perlu helper methos showDialog. 

2. Bottom Sheet memiliki konsep yang mirip dengan AlertDialog, namun Bottom Sheet akan muncul dari bawah layar aplikasi. Cara menggunakannnya kita memerlukan fungsi bawaan Flutter showModalBottomSheet, lalu kita butuh dua properti yaitu context dan builder. Di dalam Bottom Sheet ini kita bisa tambahkan widget-widget lagi.

3. Berikut adalah struktur Bottom Sheet:
```dart
showModalBottomSheet(
  context: context,
  builder: (BuildContext context) {
    return Container(
      // Widget untuk konten bottom sheet
    );
  },
);
```
Contoh implementasi bottom sheet yaitu ketika kita menghapus kontak misalnya, bottom sheet yang berisi konfirmasi hapus akan muncul, di sana terdapat tulisan "apakah Anda akan menghapus kontak ini?", lalu terdapat tombol "Ya" atau "Tidak"