void main() async {
  List<int> dataBilangan = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  print(await pengaliList(dataBilangan, 2));
  print('List data sebelum dikalikan: $dataBilangan');
}

Future<List<int>> pengaliList (List<int> dataBilangan, int pengali)  async {
  List<int> hasilPengali = [];

  await Future.delayed(Duration(seconds: 2), () {
    for (var bilangan in dataBilangan) {
      hasilPengali.add(bilangan * pengali);
    }
  });

  return hasilPengali;
}