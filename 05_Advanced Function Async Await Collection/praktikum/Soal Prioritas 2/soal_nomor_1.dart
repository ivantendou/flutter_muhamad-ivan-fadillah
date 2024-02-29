void main() {
  List<List<String>> listOfList = [
    ['Jakarta', 'Indonesia'],
    ['Malaysia', 'Kuala Lumpur'],
    ['Thailand', 'Bangkok'],
  ];

  Map<String, String> countryMap = {};

  for (var list in listOfList) {
    countryMap[list[0]] = list[1];
  }

  print(countryMap);
}
