import 'package:flutter/material.dart';
Color colorButton = Colors.blue[300] as Color;
class ButtonAnswer extends StatelessWidget {
  final String answer;
  const ButtonAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Center(
        child: Text(
          answer,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}