// Buatlah sebuah program untuk mencetak tabel perkalian.
import 'dart:io';

void main() {
  print('Masukkan sebuah angka:');
  int angka = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= angka; i++) {
    String baris = "";
    for (int j = 1; j <= angka; j++) {
      int hasil = i * j;
      baris += "$hasil ";
    }
    print(baris);
  }
}
