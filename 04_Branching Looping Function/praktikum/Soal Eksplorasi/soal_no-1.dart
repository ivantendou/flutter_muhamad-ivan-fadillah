/* 
  Buatlah sebuah program untuk mengecek apakah sebuah bilangan termasuk
  bilangan prima atau bukan.
*/

import 'dart:io';

bool isPrime(int n) {
  if (n <= 1) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  print('Masukkan sebuah angka:');
  int angka = int.parse(stdin.readLineSync()!);

  if (isPrime(angka)) {
    print('$angka merupakan bilangan prima');
  } else {
    print('$angka bukan bilangan prima');
  }
}