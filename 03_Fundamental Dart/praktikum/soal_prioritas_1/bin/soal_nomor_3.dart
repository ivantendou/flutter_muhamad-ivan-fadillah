/*
  3. Berikan contoh kode Dart yang menunjukkan perbedaan antara variabel yang bisa bernilai null
  dan variabel yang tidak bisa bernilai null. Gunakan tanda ? untuk menunjukkan bahwa
  variabel dapat bernilai null.
*/

void main() {
  String pemainSepakBola = "Nicolas Jackson";
  /*
    pemainSepakBola = null; -> ini akan menghasilkan error
    nilai null tidak bisa di-assign ke variabel String karena String tidak nullable
  */

  String? tokohAnime = "Tomozaki Fumiya";
  tokohAnime = null;

  print(pemainSepakBola);
  print(
      tokohAnime); // ketika diprint hasilnya bisa null karena String? adalah tipe data nullable
}
