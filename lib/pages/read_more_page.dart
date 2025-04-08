import 'package:flutter/material.dart';

class ReadMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(title: Text('Baca Selengkapnya')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: args != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args['judul'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    args['isi'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Kembali'),
                  ),
                ],
              )
            : Center(child: Text('Tidak ada data')),
      ),
    );
  }
}
