/*
  2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.
*/

void main() {
  int r = 20;
  int t = 10;
  final double phi = 3.14;
  print("Diketahui sebuah tabung memiliki jari-jari (r) $r cm dan tinggi (t) $t cm");

  // Volume tabung
  double volumeTabung = phi * r * r * t;
  print("Volume tabung adalah $volumeTabung cm^3");
}