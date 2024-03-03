class Matematika {
  int hasil() {
    throw UnimplementedError('Metode hasil belum diimplementasikan');
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  int hasil() {
    return fpb();
  }

  int fpb() {
    int a = x.abs();
    int b = y.abs();
    while (b != 0) {
      int t = b;
      b = a % b;
      a = t;
    }
    return a;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  int hasil() {
    return kpk();
  }

  int kpk() {
    return (x * y).abs() ~/ FaktorPersekutuanTerbesar(x, y).hasil();
  }
}
