void main() {
  List<String> list1 = ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS'];
  List<String> list2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];

  List<String> listUnik1 = hapusDuplikat(list1);
  List<String> listUnik2 = hapusDuplikat(list2);

  print('List 1 = $list1');
  print('List 2 = $list2');
  print('List unik 1 = $listUnik1');
  print('List unik 2 = $listUnik2');
}

List<String> hapusDuplikat(List<String> data) {
  Set<String> listUnik = Set<String>.from(data);
  List<String> hasil = listUnik.toList();
  return hasil;
}