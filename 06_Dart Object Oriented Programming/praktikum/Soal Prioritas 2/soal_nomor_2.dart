void main() {
  Course matematika = Course(judul: 'Matematika', deskripsi: 'Ilmu yang menyenangkan');
  Course bahasaInggris = Course(judul: 'Bahasa Inggris', deskripsi: 'Belajar bahasa Inggris');
  Student siswa01 = Student(nama: 'Ivan', kelas: 'A');
  Student siswa02 = Student(nama: 'Dimas', kelas: 'B');

  siswa01.tambahCourse(bahasaInggris);
  siswa01.tambahCourse(matematika);
  siswa01.lihatCourse();
  print('');
  siswa02.tambahCourse(bahasaInggris);
  siswa02.hapusCourse(bahasaInggris);
  siswa02.lihatCourse();
}

class Course {
  String judul;
  String deskripsi;

  Course({
    required this.judul,
    required this.deskripsi,
  });
}

class Student {
  String nama;
  String kelas;
  late List<Course> courses = [];

  Student({
    required this.nama,
    required this.kelas,
  });

  tambahCourse(Course course) {
    courses.add(course);
  }

  hapusCourse(Course course) {
    courses.remove(course);
  }

  lihatCourse() {
    print('Halo $nama!');
    print('Kursus terdaftar: ');
    if (courses.isNotEmpty) {
      for (var course in courses) {
        print(course.judul);
        print('Deskripsi: ${course.deskripsi}');
        print('---');
      }
    } else {
      print('Anda belum mendaftar kursus');
    }
  }
}
