# (12) Flutter Form

1. Dalam membuat aplikasi, agar tidak pasif terkadang kita butuh masukan/input dari pengguna. Form adalah widget untuk menerima isian data dari pengguna dan isian datanya dapat lebih dari satu. Untuk membuat form kita menggunakan StatefulWidget dan state/keadaan dari form tersebut kita simpan menggunakan GlobalKey<FormState>. Kemudian di dalam form kita bisa tambahkan widget-widget lain sebagai child-nya.

2. Terdapat berbagai macam jenis input untuk form seperti TextField, Radio, CheckBox, dan Dropdown. TextField adalah widget yang akan kita sering gunakan mengingat ini menerima isian teks dari pengguna. Begitu pula dengan Radio, CheckBox, dan Dropdown yang menyediakan opsi pilihan. 

3. Form harus memiliki Button, Button akan mengolah data yang telah kita isi, mengolah seperti menyimpan data, melakukan validasi, dan mengirim data. Kita bisa masukkan logika ketika tombol ditekan pada fungsi onPressed(). Ada beberapa jenis Button seperti ElevatedButton dan IconButton. ElevatedButton seolah-olah terlihat sebagai tombol yang timbul, sedangkan IconButton berupa ikon yang berfungsi sebagai tombol.