import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/read_more_page.dart';
import 'pages/add_curhat_page.dart'; // Sesuai nama file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MauCurhat.id',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/read_more': (context) => ReadMorePage(),
        '/add_curhat': (context) => AddCurhatPage(), // Pastikan nama rute benar
      },
    );
  }
}
