# (16) Flutter Navigation

1. Tidak lengkap rasanya kalau aplikasi hanya memiliki satu halaman, dan tidak bisa berpindah-pindah ke halaman lain. Tentunya sangat tidak efektif jika segala fitur diletakkan pada satu halaman. Maka dari itu biasanya aplikasi terdiri dari beberapa halaman. Nah, untuk navigasi atau pindah-pindah halaman dari satu halaman ke halaman lain kita dapat memanfaatkan Flutter Navigation.

2. Untuk berpindah halaman kita bisa gunakan Navigator.push(). Yang terjadi ketika kita memakai Navigator.push() adalah kita menambahkan halaman baru dan menimpa halaman sebelumnya, bayangkan ini sebagai tumpukan (stack). Sebaliknya ketika kita gunakan Navigator.pop() maka kita akan menghapus tumpukan tersebut, bagian / layer / halaman teratas dari stack akan terhapus.

3. Kita bisa menggunakan Navigation dengan Named Routes ketika aplikasi sudah kompleks. Dengan metode ini kita akan menamakan terlebih dahulu rute-rute di dalam aplikasi. Nantinya kita cukup memanggil nama rute ketika ingin menavigasi ke layar tertentu. Metode ini menavigasi ke layar dengan mudah tanpa harus membuat objek Route secara manual. Contoh Navigation dengan Named Routes:
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // rute awal
      routes: {
        '/': (context) => HomeScreen(), // rute untuk halaman beranda
        '/second': (context) => SecondScreen(), // rute untuk halaman kedua
      },
    );
  }
}

// mengggunakan Navigator.pushNamed
Navigator.pushNamed(context, '/second');
```