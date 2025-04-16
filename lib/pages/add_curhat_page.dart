import 'package:flutter/material.dart';
import '../services/api_service.dart'; // pastikan path ini sesuai struktur proyek kamu

class AddCurhatPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void submitCurhat(BuildContext context) async {
    final judul = titleController.text.trim();
    final isi = contentController.text.trim();

    if (judul.isEmpty || isi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Judul dan isi tidak boleh kosong')),
      );
      return;
    }

    try {
      final status = await ApiService().addCurhatan(judul, isi);
      if (status == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Curhatan berhasil ditambahkan!')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menambahkan curhatan')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: \$e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambahkan Curhatan')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Judul Curhatan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Isi Curhatan',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => submitCurhat(context),
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
