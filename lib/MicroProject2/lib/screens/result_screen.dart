import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/quiz_app.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Result'),
      ),
      backgroundColor: appColor,
      body: const Center(
        child: Text('Result Screen'),
      ),
    );
  }
}
 