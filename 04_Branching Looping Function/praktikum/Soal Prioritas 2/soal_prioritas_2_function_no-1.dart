/*
  Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran.
  Kemudian function lingkaran tersebut dijalankan pada function main!
*/

double luasLingkaran(int r) {
  const double phi = 3.14;
  return phi * r * r;
}

void main() {
  var hasil = luasLingkaran(14);
  print('Luas lingkaran = $hasil');
}