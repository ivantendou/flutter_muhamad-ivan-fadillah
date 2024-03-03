# (6) Dart Object Oriented Programming

1. Object Oriented Programming atau OOP adalah sebuah paradigma pemrograman populer yang memecah program menjadi bagian-bagian kecil yang disebut objek. Objek-objek yang terkait dapat dikelompokkan bersama dalam kelas yang sama, sehingga memungkinkan abstraksi dan pemodelan yang lebih baik dari dunia nyata, mudah di-*troubleshoot* dan mudah digunakan ulang. OOP memiliki beberapa bagian, diantaranya: Class, Object, Property, Method, Inheritance, Generics.

2. Class adalah sebuah *template*, abstraksi dari sebuah benda (object). Class memiliki ciri-ciri yang disebut *property* dan memiliki sifat dan kemampuan yang disebut *method*. *Property* adalah ciri-ciri suatu class yang memiliki sifat seperti variabel, cara deklarasinya pun sama. Sedangkan *method* bersifat seperti fungsi.

3. Berikut adalah cara membuat *class* dan *object*:
```dart
// membuat class
Class Hewan {
    // property
    var mata = 0;
    var kaki = 0;

    // method
    void bersuara() {
        print('');
    }
}

void main() {
    // membuat object
    var ayam = Hewan();
    ayam.bersuara();
}
```