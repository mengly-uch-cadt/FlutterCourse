import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyWidget extends StatelessWidget {
  const MyWidget({ required this.text,required this.color, super.key});
  final Color color ;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color,
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            );
  }
}

class MyGradientWidget extends StatelessWidget {
  const MyGradientWidget({required this.text, required this.colors,  super.key});

  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    // Select gradient based on the GradientType value
    final Gradient gradient;
    gradient = LinearGradient(colors: colors);

    return  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: gradient
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue[100],
              ),
              child: const Center(
                child: Text(
                  "OOP",
                  style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue[300],
              ),
              child: const Center(
                child: Text(
                  "DART",
                  style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue[600],
              ),
              child: const Center(
                child: Text(
                  "FLUTTER",
                  style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Color(0xff4E7DF5), Color(0xff083ABA)],
                ),
              ),
              child: const Center(
                child: Text(
                  "FLUTTER 2",
                  style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
        
        
      )

    );
    
  }
}
