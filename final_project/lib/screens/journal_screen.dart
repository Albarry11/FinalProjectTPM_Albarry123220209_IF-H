import 'package:flutter/material.dart';
import '../services/journal_service.dart';  // Mengimpor JournalService
import '../models/journal_model.dart';     // Mengimpor model Journal

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final _journalController = TextEditingController();  // Controller untuk TextField

  // Fungsi untuk menyimpan jurnal
  void _saveJournal() {
    final content = _journalController.text;  // Mengambil teks yang dimasukkan
    if (content.isNotEmpty) {
      final journal = Journal(content: content, date: DateTime.now());  // Membuat objek jurnal
      JournalService().saveJournal(journal);  // Menyimpan jurnal menggunakan JournalService
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Journal saved!')),  // Menampilkan SnackBar setelah menyimpan
      );
      _journalController.clear();  // Mengosongkan TextField setelah menyimpan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Write Journal')),  // Judul halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding untuk body
        child: Column(
          children: [
            TextField(
              controller: _journalController,  // Menghubungkan controller dengan TextField
              decoration: const InputDecoration(labelText: 'Write your journal'),
              maxLines: 5,  // Maksimal 5 baris untuk jurnal
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveJournal,  // Ketika tombol ditekan, simpan jurnal
              child: const Text('Save Journal'),
            ),
          ],
        ),
      ),
    );
  }
}
