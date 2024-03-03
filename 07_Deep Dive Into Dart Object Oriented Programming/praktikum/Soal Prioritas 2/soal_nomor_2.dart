import 'soal_nomor_1.dart';

void main() {
  FaktorPersekutuanTerbesar fpb = FaktorPersekutuanTerbesar(4, 8);
  KelipatanPersekutuanTerkecil kpk = KelipatanPersekutuanTerkecil(4, 8);

  print('FPB dari 4 dan 8: ${fpb.hasil()}');
  print('KPK dari 4 dan 8: ${kpk.hasil()}');
}
