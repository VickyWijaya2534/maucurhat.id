import 'package:flutter/material.dart';

class ReadMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baca Selengkapnya')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              color: Colors.blue.shade100, // ✅ Padding berwarna biru
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lose Streak',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hari ini aku main moba tapi kena kutukan motion. Rasanya kesel banget, udah latihan lama tapi tetap kalah. Mungkin emang harus rehat dulu kali ya?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    label: Text('Dukung'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Kembali'),
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
