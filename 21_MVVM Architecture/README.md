# (21) MVVM Architecture

1. MVVM adalah pola arsitektur perangkat lunak yang memisahkan pengembangan dari User Interface (UI), business logic, dan model. Keuntungan dari MVVM yaitu *reusability*, *maintainability*, dan *testability*. *Reusability* jika ada beberapa tampilan yang memerlukan alur logic yang sama, kita bisa menggunakan ViewModel yang sama. *Maintainability* artinya mudah dirawat karena tampilan dan logika tidak bertumpuk. Lalu *testability* artinya pengujian menjadi terpisah antara pengujian tampilkan dan pengujian logika.

2. Struktur direktorinya untuk model memiliki dua bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut. Lalu tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel.

3. Di bagian model terdapat kelas yang merupakan bentuk data yang akan digunakan. Lalu ada sumber data baik dari api atau pun dari database. Di bagian ViewModel kita menyimpan data-data dan logika yang diperlukan halaman UI.
Contoh model:
```dart
class ContactModel {
  final String name;
  final String number;
  final DateTime date;
  final Color color;
  final PlatformFile? file;

  ContactModel({
    required this.name,
    required this.number,
    required this.date,
    required this.color,
    this.file,
  });
}
```
Contoh ViewModel:
```dart

class ContactViewModel with ChangeNotifier {
  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  TextEditingController _numberController = TextEditingController();
  TextEditingController get numberController => _numberController;

  List<ContactModel> _contactList = [];
  List<ContactModel> get contactList => _contactList;

  bool _isEditing = false;
  bool get isEditing => _isEditing;

  int _editingIndex = -1;
  int get editingIndex => _editingIndex;

  final _currentDate = DateTime.now();
  get currentDate => _currentDate;

  DateTime dueDate = DateTime.now();
  Color currentColor = Colors.orange;
  Color selectedColor = Colors.orange;
  PlatformFile? selectedFile;

  void openFile(PlatformFile file) {
    OpenFilex.open(file.path);
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    selectedFile = file;
    openFile(file);
    notifyListeners();
  }

  void editContact(int index) {
    _nameController.text = _contactList[index].name;
    _numberController.text = _contactList[index].number;
    dueDate = _contactList[index].date;
    selectedColor = _contactList[index].color;
    selectedFile = _contactList[index].file;
    _isEditing = true;
    _editingIndex = index;
    notifyListeners();
  }

  void deleteContact(int index) {
    _contactList.removeAt(index);
    notifyListeners();
  }

  void onSubmit() {
    if (_isEditing) {
      _contactList[_editingIndex] = ContactModel(
        name: _nameController.text,
        number: _numberController.text,
        date: dueDate,
        color: selectedColor,
        file: selectedFile,
      );
      _isEditing = false;
      _editingIndex = -1;
    } else {
      _contactList.add(
        ContactModel(
          name: _nameController.text,
          number: _numberController.text,
          date: dueDate,
          color: selectedColor,
          file: selectedFile,
        ),
      );

      _nameController.clear();
      _numberController.clear();
      notifyListeners();

      debugPrint("Contact List:");
      for (var contact in _contactList) {
        debugPrint(
            "Name: ${contact.name}, Number: ${contact.number}, Date ${contact.date}, Color ${contact.color}, File ${contact.file}");
      }
    }
  }

  String? validateName(String? value) {
    if (value?.isEmpty == true) {
      return 'Name must not be empty.';
    } else if ((value?.length ?? 0) < 2) {
      return 'The name must consist of at least 2 words.';
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value!)) {
      return 'Name should not contain special characters or numbers.';
    } else if (!RegExp(r'^[A-Z][a-z]*([\s-][A-Z][a-z]*)*$').hasMatch(value)) {
      return 'Each word should start with a capital letter.';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value?.isEmpty == true) {
      return 'Number must not be empty.';
    } else if (!RegExp(r'^0').hasMatch(value!)) {
      return 'Phone number must start with 0.';
    } else if (value.length < 8) {
      return 'The phone number must be a minimum of 8 digits long.';
    } else if (value.length > 15) {
      return 'The phone number must be a maximum of 15 digits long.';
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void setDate(DateTime date) {
    dueDate = date;
    notifyListeners();
  }

  void setColor(Color color) {
    currentColor = color;
    notifyListeners();
  }

  void saveSelectedColor() {
    selectedColor = currentColor;
    notifyListeners();
  }
}
```