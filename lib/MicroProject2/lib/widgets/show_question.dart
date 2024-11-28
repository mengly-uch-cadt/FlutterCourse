import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/model/question.dart';
import 'package:practice/MicroProject2/lib/widgets/button_answer.dart';

class ShowQuestion extends StatelessWidget {
  final Question question;
  final int orderQuestion;
  const ShowQuestion({super.key, required this.question, required this.orderQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "$orderQuestion. ${question.title}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...question.possibleAnswers.map((answer) => Column(
          children: [
            const SizedBox(height: 10),
            ButtonAnswer(answer: answer),
          ],
        )),
      ],
    );
  }
}