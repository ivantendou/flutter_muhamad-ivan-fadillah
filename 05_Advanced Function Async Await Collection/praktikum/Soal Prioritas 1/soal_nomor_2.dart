void main() {
  List<dynamic> dataAcak = [
    'Nico',
    2,
    2.5,
    true,
    false,
    'Palpatine',
    34,
    true,
    'Barbar'
  ];

  countDataTypes(dataAcak);
}

void countDataTypes(List<dynamic> data) {
  int intCount = 0;
  int doubleCount = 0;
  int boolCount = 0;
  int stringCount = 0;

  for (var item in data) {
    if (item is int) {
      intCount++;
    } else if (item is double) {
      doubleCount++;
    } else if (item is bool) {
      boolCount++;
    } else if (item is String) {
      stringCount++;
    }
  }

  print('Jumlah data bertipe int = $intCount');
  print('Jumlah data bertipe double = $doubleCount');
  print('Jumlah data bertipe boolean = $boolCount');
  print('Jumlah data bertipe String = $stringCount');
}
