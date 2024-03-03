class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(
    this.panjang,
    this.lebar,
    this.tinggi,
  );

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Balok extends BangunRuang {
  Balok(
    double panjang,
    double lebar,
    double tinggi,
  ) : super(panjang, lebar, tinggi);
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);
}
