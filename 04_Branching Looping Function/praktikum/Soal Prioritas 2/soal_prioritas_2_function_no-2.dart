/*
  Buatlah sebuah function yang dapat menampilkan faktorial dari nilai-nilai di bawah ini:
  10, 40, 50
*/

BigInt faktorial(int number) {
  BigInt hasil = BigInt.one;
  for (var i = BigInt.two; i <= BigInt.from(number); i += BigInt.one) {
    hasil *= i;
  }
  return hasil;
}

void main() {
  var faktorial10 = faktorial(10);
  var faktorial40 = faktorial(40);
  var faktorial50 = faktorial(50);

  print('Faktorial dari 10 = $faktorial10');
  print('Faktorial dari 40 = $faktorial40');
  print('Faktorial dari 50 = $faktorial50');
}
