# (21) UI Testing

1. UI Testing atau disebut juga widget testing adalah pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan adanya suatu widget, dapat menerima interaksi, dan memberikan respon ke pengguna. Dengan UI Testing kita mendapatkan keuntungan karena kita tidak perlu memastikan satu per satu tampilan seluruh widget secara manual, tetapi kita memastikannya dengan script UI Testing.

2. Untuk melakukan testing, kita perlu menambahkan package flutter_test, namun ini biasanya sudah terinstall sejak pertama kali proyek dibuat.
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
```
Letak script testing berada di dalam folder test, sebaiknya nama file harus diikuti dengan _test.dart, misal contact_test.dart supaya kita tahu ini merupakan file testing. Untuk script testing ini, tiap filenya berisi fungsi main dan kita buat setiap skenenario test di dalamnya (test case) seperti berikut:
```dart
void main() {
    testWidgets('Judul halaman harus Contact', (WidgetTester tester) async {
        // tester.pumpWidget untuk mengaktifkan halaman
        await tester.pumpWidget(
            home: ContactScreen(),
        ),
        
        // mengecek apakah ada text yang bertuliskan 'Contact'
        // findsOneWidget artinya pencarian menempatkan tepat pada satu widget di Widget Tree
        expect(find.text('Contact'), findsOneWidget);
    });
}
```

3. Hasil akhir dari pengembangan aplikasi mobile tentunya adalah aplikasi dalam format APK/AAB untuk Android atau AAB untuk iOS. Untuk menghasilkan itu, kita perlu melakukan yang namanya build flutter. Terdapat 3 mode build yaitu mode debug, profile, dan release. Mode debug digunakan untuk pengujian selama proses development. Mode profile digunakan untuk pengujian performa aplikasi. Mode release untuk merilis aplikasi ke Google Play Store dan Stores android lainnya.
```
flutter build apk --debug
flutter build apk --profile
flutter build apk --release
```

Pada android, kita bisa mengatur nama aplikasi di file AndroidManifest.xml, di file ini kita juga mengatur hal lain seperti komponen, permission, dll. Untuk mengatur ikon aplikasi, kita bisa genereate image di Android Asset Studio, hasilnya bisa kita copy-kan ke folder ic/launcher/res/.

Untuk iOS sendiri, kita baru bisa build jika punya iOS atau MacOS, dan perlu mendaftar akun Apple Developer Program. Kalau di iOS temapt konfigurasi data terdapat di foldr ios/Runner/info.plist. Untuk generate icon aplikasi bisa dilakukan dengan App Icon Generator, kemudian hasilnya di-copy ke folder ios/Runner/Asssets.xcassets/AppIcon.appiconset.

Selain cara di atas, untuk melakukan penggantian nama aplikasi atau generate ikon aplikasi, kita bisa melakukannya dengan package. Terdapat package rename untuk ganti nama aplikasi dan package flutter launcher icons untuk generate ikon aplikasi.
