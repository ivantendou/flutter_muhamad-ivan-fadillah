/*
  2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.
*/

import 'dart:io';

void main() {
  print("Masukkan sebuah bilangan:");
  int bilangan = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}