import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("My Hobbies"),
      ),
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: "Travelling", icon: Icons.travel_explore, color: Color(0xFF4CB050)),
              HobbyCard(title: "Skating2", icon: Icons.skateboarding, color: Color(0xFF607D8B)),
            ],
          ),
        )
    );
  }
}


class HobbyCard extends StatelessWidget {
  const HobbyCard({
    required this.title,
    required this.icon, 
    this.color = Colors.blue,
    super.key
    });

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      child: Row(
        children: [
          Icon(
            icon, 
            color: Colors.white, 
            size: 30
          ),
          const SizedBox(width: 20,),
          Text(title, style: const TextStyle(fontSize: 30, color: Colors.white),),
        ],
      ),
    );
  }
}