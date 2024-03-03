void main() {
  Mobil trukPakSomad = Mobil(kapasitas: 200);
  Hewan domba = Hewan(berat: 150);
  Hewan sapiLimousin = Hewan(berat: 1600);

  print('Menambah sebuah domba...');
  trukPakSomad.tambahMuatan(domba);
  print('');
  print('Menambah sebuah sapi limousin...');
  trukPakSomad.tambahMuatan(sapiLimousin);
}

class Hewan {
  int berat;

  Hewan({required this.berat});
}

class Mobil {
  int kapasitas;
  List<Hewan> muatan = [];
  int totalMuatan = 0;

  Mobil({required this.kapasitas});

  void tambahMuatan(Hewan hewan) {
    if (kapasitas >= totalMuatan + hewan.berat) {
      muatan.add(hewan);
      totalMuatan += hewan.berat;
      print('Hewan berhasil dimuat ke dalam mobil');
      print('Informasi kapasitas muatan: ($totalMuatan/$kapasitas)');
    } else {
      print('Upss, kapasitas muatan sudah tidak cukup');
    }
  }
}