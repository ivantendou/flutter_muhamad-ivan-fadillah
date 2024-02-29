void main() {
  List<int> listNilai = [90, 90, 80, 75, 40];

  int rataRataNilai = hitungRataRata(listNilai);
  print(rataRataNilai);
}

int hitungRataRata(List<int> listAngka) {
  if (listAngka.isEmpty) {
    return 0;
  }

  int total = 0;
  for (var angka in listAngka) {
    total += angka;
  }

  double rataRata = total / listAngka.length;
  return rataRata.ceil();
}