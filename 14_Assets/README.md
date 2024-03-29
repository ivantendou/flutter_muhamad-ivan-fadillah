# (14) Assets

1. Assets adalah file yang di-*bundled* dan di-*deployed* bersamaan dengan aplikasi. Static data (JSON files), icons, images, dan font file (ttf) adalah assets yang nantinya akan kita gunakan untuk konten di aplikasi. Untuk menentukan assets, pertama-tama kita harus edit pubspec.yaml yang terletak di *root project*, hal ini bertujuan untuk mengidentifikasi assets yang dibutuhkan aplikasi.

2. Pada pubspec.yaml untuk memasukkan assets kita bisa masukkan satu per satu seperti berikut:
```yaml
assets: 
  - asssets/my_icon.png
  - assetst/background.jpg
```
Akan tetapi lebih efektif jika kita langsung memasukkan semua assets dari satu directory name seperti contoh berikut:
```yaml
assets:
  - assets/
```

3. Untuk assets image atau gambar kita bisa load menggunakan method Image.asset untuk mengambil image yang sudah ditambahkan dalam *project*, atau method Image.network yang mendapatkan data image dari internet.
```dart
Image.asset('asset/background.jpg'),
Image.network('https://picsum.photos/id/1/200/300'),
```
Lalu kita bisa menggunakan custom font dengan cara import file .ttf ke assets dan didaftarkan di pubspec.yaml seperti berikut:
```yaml
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
        - asset: assets/fonts/Poppins-Medium.ttf
          weight: 500
        - asset: assets/fonts/Poppins-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
```