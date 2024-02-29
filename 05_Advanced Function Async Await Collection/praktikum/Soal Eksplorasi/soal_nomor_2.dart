void main() {
  List<String> listBahasaPemrograman = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];
  Map<String, int> frekuensiBahasa = hitungFrekuensi(listBahasaPemrograman);
  print('input: $listBahasaPemrograman');
  print('output: $frekuensiBahasa');
}

Map<String, int> hitungFrekuensi(List<String> list) {
  final frekuensiMap = <String, int>{};
  for (final bahasa in list) {
    frekuensiMap.update(bahasa, (frekuensi) => frekuensi + 1, ifAbsent: () => 1);
  }

  return frekuensiMap;
}