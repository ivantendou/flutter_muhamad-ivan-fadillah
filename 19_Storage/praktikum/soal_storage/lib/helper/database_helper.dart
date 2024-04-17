import 'package:path/path.dart';
import 'package:soal_storage/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = 'contacts';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'contact_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT,
            date TEXT,
            color INTEGER
          )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertContact(ContactModel contactModel) async {
    final Database db = await database;
    await db.insert(_tableName, contactModel.toMap());
  }

  Future<List<ContactModel>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<ContactModel> getContactById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => ContactModel.fromMap(e)).first;
  }

  Future<void> updateContact(ContactModel contactModel) async {
    final db = await database;
    await db.update(
      _tableName,
      contactModel.toMap(),
      where: 'id = ?',
      whereArgs: [contactModel.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDatabaseOnLogout() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contact_db.db');
    await deleteDatabase(path);
  }
}
