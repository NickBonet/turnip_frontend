import 'package:flutter/material.dart';
import './pages/HomePage.dart';

void main() => runApp(TurnipApp());

class TurnipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Turnip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Project Turnip'),
    );
  }
}




