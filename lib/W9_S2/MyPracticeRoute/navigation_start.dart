import 'package:flutter/material.dart';
import 'package:practice/W9_S2/MyPracticeRoute/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation Demo',
      home: HomeScreen(),
    );
  }
}
