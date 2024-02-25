// Buatlah sebuah jam pasir

void main() {
  int tinggi = 6;

  for (int i = 1; i <= tinggi; i++) {
    String baris = "";

    for (int j = 1; j < i; j++) {
      baris += ' ';
    }

    for (int k = 1; k <= (tinggi * 2) - (i * 2) + 1; k++) {
      baris += '0';
    }

    for (int l = 1; l < i; l++) {
      baris += ' ';
    }

    print(baris);
  }

  for (int i = tinggi - 1; i >= 1; i--) {
    String baris = "";

    for (int j = 1; j < i; j++) {
      baris += ' ';
    }

    for (int k = 1; k <= (tinggi * 2) - (i * 2) + 1; k++) {
      baris += '0';
    }

    for (int l = 1; l < i; l++) {
      baris += ' ';
    }

    print(baris);
  }
}
