import 'package:flutter/material.dart';

class AddCurhatPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambahkan Curhatan')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              color: Colors.blue.shade100, // ✅ Padding berwarna biru
              child: Column(
                children: [
                  Text(
                    'Tambah Curhatan Baru',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tulis ceritamu dan bagikan dengan komunitas!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Curhatan Ditambahkan!')),
                      );
                      Navigator.pop(context);
                    },
                    child: Text('Kirim'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
