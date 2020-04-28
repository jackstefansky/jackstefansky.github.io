import 'package:flutter/material.dart';
import 'package:portfolio/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bagerjack Team',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MainPage(),
      
    );
  }
}
