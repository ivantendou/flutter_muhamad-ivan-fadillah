void main() {
  Calculator kalkulator = Calculator();

  print('Penjumlahan: ${kalkulator.tambah(4, 4)}');
  print('Pengurangan: ${kalkulator.kurang(10, 4)}');
  print('Perkalian: ${kalkulator.kali(4, 4)}');
  print('Pembagian: ${kalkulator.bagi(20, 4)}');
}

class Calculator {
  // method untuk melakukan penjumlahan
  int tambah(int a, int b) {
    return a + b;
  }

  // method untuk melakukan pengurangan
  int kurang(int a, int b) {
    return a - b;
  }

  // method untuk melakukan perkalian
  int kali(int a, int b) {
    return a * b;
  }

  // method untuk melakukan pembagian
  int bagi(int a, int b) {
    return a ~/ b;
  }
}
