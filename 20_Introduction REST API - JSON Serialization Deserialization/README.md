# (20) Introduction REST API - JSON serialization/deserialization

1. Untuk menambah isi dan fungsionalitas aplikasi kita memerlukan data, data tersebut bisa kita dapatkan dari server. REST API (Representational State Transfer Application Programming Interface) adalah arsitektural yang memsiahkan tampilan dengan proses bisnis. Bagian tampilan dan proses bisnis berkirim data melalui HTTP Request. Untuk mendapatkan data dalam hal ini klien akan mengirim request lalu server mengolah dan membalasnya dengan memberikan response. 

2. Dio adalah tools yang bisa kita gunakan untuk melakukuan REST API. Berikut ini adalah contoh kode untuk melakuakan method POST menggunakan Dio, di sini kita mengirim data yang ditaruh di parameter data saat melakukan POST.
```dart
void sendData() async {
    try {
      var dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      
      var data = {
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      };

      var response = await dio.post('https://jsonplaceholder.typicode.com/posts', data: data);
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
}
```
method POST ini digunakan untuk mengirim data baru ke server. Method lainnya seperti GET digunakan untuk membaca data dari server. Ada juga PUT yang digunakan untuk memperbarui data yang sudah ada di server.
DELETE digunakan untuk menghapus data dari server.

3. Sering kali data yang dipertukarkan antara klien dan server adalah dalam format JSON. Untuk itu kita perlu mengetahui cara decode dan encode JSON dari/ke format lain. JSON Serialization adalah proses mengubah objek atau struktur data dalam bahasa pemrograman menjadi representasi JSON. Sedangkan JSON Deserialization adalah proses mengubah data JSON menjadi objek atau struktur data dalam bahasa pemrograman. Berikut adalah ContactModel yang di-generate melalui `quicktype.io`.
```dart
import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
    int id;
    String name;
    String phone;

    ContactModel({
        required this.id,
        required this.name,
        required this.phone,
    });

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
    };
}
```
Pada kode diatas terlihat ada metode yang mengubah format JSON ke dalam bentuk yang kita perlukan, dalam kasus ini menjadi data di ContactModel yang bertipe Map<String, dynamic>.
