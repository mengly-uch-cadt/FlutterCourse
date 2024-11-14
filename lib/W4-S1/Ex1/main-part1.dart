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
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(bottom: 20),
                decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF4CB050),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.travel_explore, 
                      color: Colors.white, 
                      size: 30
                    ),
                    SizedBox(width: 20,),
                    Text("Travelling", style: TextStyle(fontSize: 30, color: Colors.white),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF607D8B),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.skateboarding, 
                      color: Colors.white, 
                      size: 30
                    ),
                    SizedBox(width: 20,),
                    Text("Skating", style: TextStyle(fontSize: 30, color: Colors.white),),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
