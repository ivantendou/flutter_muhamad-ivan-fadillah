/*
  2. Implementasikan rumus keliling dan luas dari Lingkaran 
  dengan menggunakan Bahasa Dart
*/

void main() {
  final double phi = 3.14;
  int r = 14;
  print("Diketahui sebuah lingkaran mempunyai jari-jari(r) = $r cm");

  // Keliling Lingkaran
  double kelilingLingkaran = 2 * phi * r;
  print("Keliling lingkaran = $kelilingLingkaran cm");

  // Luas Lingkaran
  double luasLingkaran = phi * r * r;
  print("Luas lingkaran = $luasLingkaran cm");
}