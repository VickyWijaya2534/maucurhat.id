import 'package:flutter/material.dart';
import 'home_page.dart';
import 'read_more_page.dart';
import 'add_curhat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MauCurhat.id',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF7F5FA),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/read_more': (context) => ReadMorePage(),
        '/add_curhat': (context) => AddCurhatPage(),
      },
    );
  }
}
