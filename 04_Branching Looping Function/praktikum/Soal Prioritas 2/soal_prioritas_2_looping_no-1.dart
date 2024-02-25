// Buatlah sebuah piramid bintang

void main() {
  int n = 8;
  for (int i = 1; i <= n; i++) {
    String baris = "";

    for (int j = 1; j <= n - i; j++) {
      baris += ' ';
    }

    for (int k = 1; k <= 2 * i - 1; k++) {
      baris += '*';
    }

    print(baris);
  }
}
