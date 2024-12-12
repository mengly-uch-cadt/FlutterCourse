import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(40),
        color: Colors.blue[300],
        // child: Text("hellooo"),
        child: Container(
          
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue[600],),
          child: const Center(
            child: Text("CADT Students", style: TextStyle(fontSize: 20, decoration: TextDecoration.none , color: Colors.white),),
          ),
        ),

      ),

    );
    
  }
}
