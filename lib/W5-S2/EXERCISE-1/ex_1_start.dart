import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> colors = ["red", "blue", "green"];

    // Method 1: Using a dedicated function
  List<Widget> getLabels() {
    return colors.map((color) => Label(color)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Display Colors'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for(var color in colors) Label(color),

            const Label("Method 2: Map", bold: true),
            ...colors.map((item) => Label(item)).toList(),

            const Label("Method 3: Dedicated Function", bold: true),
            // ... it called spread operator. It is used to unpack the elements of a list.
            ...getLabels(),

          ],
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
