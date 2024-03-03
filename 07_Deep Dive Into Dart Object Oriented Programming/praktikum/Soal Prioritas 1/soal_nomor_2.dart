import 'soal_nomor_1.dart';

void main() {
  var balok = Balok(10, 5, 4);
  var kubus = Kubus(4);

  print('Volume Balok: ${balok.volume()}');
  print('');
  print('Volume Kubus: ${kubus.volume()}');
}