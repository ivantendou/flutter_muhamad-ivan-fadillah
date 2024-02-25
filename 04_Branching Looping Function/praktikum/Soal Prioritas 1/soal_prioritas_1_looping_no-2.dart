/*
  Terdapat nilai list dengan data antara lain:
  'Apple', 'Banana', 'Avocado', 'Cherry', 'Mango', 'Apricot', 'Blueberry', 'Acerola', 'Grape', 'Almond'
  
  - Berdasarkan data diatas tampilkan semua data yang diawali dengan karakter A
  - Menggunakan salah satu teknik for yakni for loop in
  - Gunakan method startsWith untuk mengecek karakter pertama
*/

void main() {
  List<String> fruitList = ['Apple', 'Banana', 'Avocado', 'Cherry', 'Mango', 'Apricot', 'Blueberry', 'Acerola', 'Grape', 'Almond'];

  for (String fruit in fruitList) {
    if (fruit.startsWith('A')) {
      print(fruit);
    }
  }
}