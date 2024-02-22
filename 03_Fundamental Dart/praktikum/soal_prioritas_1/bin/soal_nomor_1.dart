/* 
  1. Buatlah rumus keliling dan luas persegi dan persegi panjang dengan menggunakan
  bahasa pemrograman Dart
*/

void main() {
  // Persegi
  int sisi = 5;
  print("Diketahui sebuah persegi memiliki sisi $sisi cm");

  // Luas Persegi
  int luasPersegi = sisi * sisi;
  print("Luas persegi = $luasPersegi cm");

  // Keliling Persegi
  int kelilingPersegi = 4 * sisi;
  print("Keliling persegi = $kelilingPersegi");

  print("");

  // Persegi Panjang
  int panjang = 6;
  int lebar = 5;
  print(
      "Diketahui sebuah persegi panjang memiliki panjang $panjang cm dan lebar $lebar cm");

  // Luas Persegi Panjang
  int luasPersegiPanjang = panjang * lebar;
  print("Luas pergsegi panjang = $luasPersegiPanjang cm");

  // Keliling Persegi Panjang
  int kelilingPersegiPanjang = 2 * (panjang + lebar);
  print("Keliling persegi panjang = $kelilingPersegiPanjang cm");
}
