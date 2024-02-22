import 'dart:io';

/*
  1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan.
  Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara baca atau
  susunan yang sama persis.
*/

void main() {
  print("Masukkan sebuah kata:");
  String kata = stdin.readLineSync()!.toLowerCase();

  if (cekPalindrom(kata)) {
    print("$kata adalah sebuah palindrom");
  } else {
    print("$kata bukan sebuah palindrom");
  }
}

bool cekPalindrom(String kata) {
  String balikKata = kata.split('').reversed.join('');
  return kata == balikKata;
}
