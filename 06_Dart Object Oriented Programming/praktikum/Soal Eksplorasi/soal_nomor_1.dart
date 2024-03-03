void main() {
  var tokoBuku = SistemTokoBuku();

  tokoBuku
      .tambahBuku(Buku(001, "The Alchemist", "Penerbit A", 149000, "Fiksi"));
  tokoBuku.tambahBuku(
      Buku(002, "Matematika Dasar", "Penerbit B", 119000, "Pendidikan"));
  tokoBuku.tambahBuku(
      Buku(003, "Pemrograman Dart", "Penerbit C", 201000, "Komputer"));

  print("Daftar Buku:");
  tokoBuku.getSemuaBuku().forEach((buku) {
    print(
        "ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}");
  });
  tokoBuku.hapusBuku(2);
  print('Setalah buku dengan id 2 dihapus:');
  tokoBuku.getSemuaBuku().forEach((buku) {
    print(
        "ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}");
  });
}

class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class SistemTokoBuku {
  List<Buku> _daftarBuku = [];

  void tambahBuku(Buku buku) {
    _daftarBuku.add(buku);
  }

  List<Buku> getSemuaBuku() {
    return _daftarBuku;
  }

  void hapusBuku(int id) {
    _daftarBuku.removeWhere((buku) => buku.id == id);
  }
}
