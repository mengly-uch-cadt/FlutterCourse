import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/model/question.dart';
class ShowQuestion extends StatefulWidget {
  final Question question;
  final int orderQuestion;
  final Function(String) onAnswer;
  final String? selectedAnswer; // Pass the selected answer

  const ShowQuestion({
    super.key,
    required this.question,
    required this.orderQuestion,
    required this.onAnswer,
    this.selectedAnswer,
  });

  @override
  State<ShowQuestion> createState() => _ShowQuestionState();
}

class _ShowQuestionState extends State<ShowQuestion> {
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    // Initialize the selectedAnswer with the value passed from the parent widget
    selectedAnswer = widget.selectedAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
                "${widget.orderQuestion}. ${widget.question.title}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: widget.question.possibleAnswers.map((answer) {
              final isSelected = answer == selectedAnswer;
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green[300] : Colors.blue[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedAnswer = answer; // Update local state
                        });
                        widget.onAnswer(answer); // Notify parent of selection
                      },
                      child: Text(
                        answer,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
