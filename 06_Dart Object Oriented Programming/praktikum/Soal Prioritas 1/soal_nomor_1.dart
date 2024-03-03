void main() {
  Hewan hewan1 = Hewan(20);
  Hewan hewan2 = Hewan(40);
  print(hewan1.berat);
  print(hewan2.berat);
}

class Hewan {
  int? berat;

  Hewan(this.berat);
}