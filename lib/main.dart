import 'package:flutter/material.dart';
import 'package:sfero/screens/start/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sfero',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.purple[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
    );
  }
}
