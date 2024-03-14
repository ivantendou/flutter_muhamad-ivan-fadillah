# (10) Platform Widget

1. Kita bisa memanfaatkan widget dengan gaya berbeda pada Android dan iOS dengan widget MaterialApp dan CupertinoApp. MaterialApp adalah widget dasar yang mengemas seluruh widget dalam aplikasi, widget ini digunakan pada sistem Android, sementara itu Cupertino App widget yang digunakan pada sistem iOS.

2. Untuk menggunakan MaterialApp, kita bisa *import package* dari package:flutter/material.dart. Pada struktur widget, kita bisa mengatur tema aplikasi pada parameter *theme*, dan mengatur halaman utama pada parameter *home*. Untuk halaman-halaman kita bisa gunakan widget Scaffold. Pada Scaffold terdapat parameter *appBar* untuk mengatur menu bagian atas halaman, *drawer* untuk mengatur menu bagian samping, *body* untuk mengisi bagian utama halaman, dan *bottomNavigationBar* untuk mengatur bagian bawah halaman (navigasi).

3. Untuk menggunakan CupertionoApp, kita bisa *import package* dari package:flutter/cupertino.dart. Struktur CupertinoApp mirip dengan MaterialApp, namun beda penamaannya. Untuk widget utama kita pakai widget CupertinoApp, dan untuk halaman-halamannya kita pakai CupertinoPageScaffold.