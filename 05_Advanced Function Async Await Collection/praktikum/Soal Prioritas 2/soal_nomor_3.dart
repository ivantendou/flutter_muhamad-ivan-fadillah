import 'dart:io';

void main() async {
  print('Masukkan sebuah bilangan:');
  int bilangan = int.parse(stdin.readLineSync()!);

  try {
    print('Memproses perhitungan faktorial dari $bilangan...');
    int faktorial = await hitungFaktroial(bilangan);
    print('Faktorial dari $bilangan adalah: $faktorial');
  } catch (e) {
    print(e);
  }
}

Future<int> hitungFaktroial(int n) async {
  int hasil = 1;
  await Future.delayed(Duration(seconds: 3), () {
    if (n < 0) {
      throw ArgumentError(
          'Tidak dapat menghitung faktorial dari bilangan negatif.');
    }

    for (int i = 2; i <= n; i++) {
      hasil *= i;
    }
  });

  return hasil;
}
