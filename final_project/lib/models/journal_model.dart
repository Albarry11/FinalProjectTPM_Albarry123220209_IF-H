class Journal {
  final int? id;
  final String content;
  final DateTime date;

  // Konstruktor untuk kelas Journal
  Journal({this.id, required this.content, required this.date});

  // Fungsi untuk mengonversi objek Journal menjadi map agar bisa disimpan di database
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'date': date.toIso8601String(),  // Mengonversi DateTime ke string ISO
    };
  }

  // Fungsi untuk mengonversi map ke objek Journal
  factory Journal.fromMap(Map<String, dynamic> map) {
    return Journal(
      id: map['id'],
      content: map['content'],
      date: DateTime.parse(map['date']),
    );
  }
}
