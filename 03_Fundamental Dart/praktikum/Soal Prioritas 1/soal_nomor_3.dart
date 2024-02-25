/*
  3. Berikan contoh kode Dart yang menunjukkan perbedaan antara variabel yang bisa bernilai null
  dan variabel yang tidak bisa bernilai null. Gunakan tanda ? untuk menunjukkan bahwa
  variabel dapat bernilai null.
*/

void main() {
  int? nullableInt = null;

  print("nullableInt = $nullableInt");

  /*
    Menggunakan coalescing operator (??), ini akan mengevaluasi ekspresi dan mengembalikan nilai 
    dari ekspresi pertama jika itu bukan null.
  */
  int nonNullableInt = nullableInt ?? 0;
  print("nonNullableInt = $nonNullableInt");
}
