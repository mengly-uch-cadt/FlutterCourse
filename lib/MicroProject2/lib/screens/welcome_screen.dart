import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  
  get onTap {
    return () {
      print('Start Quiz');
    };
  }
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/microproject2/quiz-logo.png'),
              const SizedBox(height: 20),
              const Text("Crazy Quiz", style: TextStyle(fontSize: 30, color: Colors.white)),
              const SizedBox(height: 20),
              // ignore: prefer_const_constructors
              AppButton("Start Quiz", icon: Icons.arrow_right_alt, onTap: onTap), 
            ],
          ),
        );
  }
}
 
