import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';  // Untuk mendapatkan path dari database
import '../models/journal_model.dart';  // Mengimpor model Journal

class JournalService {
  // Membuka atau membuat database
  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'journals.db');  // Lokasi database
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      // Membuat tabel jika belum ada
      await db.execute('''
        CREATE TABLE journals(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          content TEXT,
          date TEXT
        )
      ''');
    });
  }

  // Menyimpan jurnal ke dalam database
  Future<void> saveJournal(Journal journal) async {
    final db = await _openDatabase();
    await db.insert(
      'journals',
      journal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Mengambil semua jurnal dari database
  Future<List<Journal>> getJournals() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query('journals');
    return List.generate(maps.length, (i) {
      return Journal.fromMap(maps[i]);  // Mengonversi map ke objek Journal
    });
  }
}
