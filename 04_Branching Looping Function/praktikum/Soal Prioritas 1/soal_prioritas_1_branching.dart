/*
  Terdapat sebuah nilai:
  jika nilai > 70 akan mereturn “Nilai A”
  jika nilai > 40 akan mereturn “Nilai B”
  jika nilai > 0 akan mereturn “Nilai C”
  selain itu return teks kosong
*/
import 'dart:io';

void main() {
  print('Masukkan nilai Anda:');
  int nilai = int.parse(stdin.readLineSync()!);

  if (nilai > 70) {
    print('Nilai A');
  } else if (nilai > 40) {
    print('Nilai B');
  } else if (nilai > 0) {
    print('Nilai C');
  } else {
    print(' ');
  }
}
