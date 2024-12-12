import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/model/answer.dart';
import 'package:practice/MicroProject2/lib/model/question.dart';

class ShowResult extends StatefulWidget {
  final Question question;
  final int orderQuestion;
  final String userAnswer;

  const ShowResult({
    super.key,
    required this.question,
    required this.orderQuestion,
    required this.userAnswer,
  });

  @override
  State<ShowResult> createState() => _ShowQuestionState();
}

class _ShowQuestionState extends State<ShowResult> {
  late String userAnswer;

  @override
  void initState() {
    super.initState();
    // Initialize the userAnswer with the value passed from the parent widget
    userAnswer = widget.userAnswer;
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
            child: Text(
              "${widget.orderQuestion}. ${widget.question.title}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: widget.question.possibleAnswers.map((answer) {
              final isAnswerCorrect = widget.question.goodAnswer == answer && widget.question.goodAnswer == userAnswer;
              final isWrongAnswer = widget.question.goodAnswer != answer && userAnswer == answer;
              
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: isAnswerCorrect
                          ? Colors.green[300]
                          : isWrongAnswer
                              ? Colors.red[300]
                              : Colors.blue[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          if (isAnswerCorrect) ...[
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ] else ...[
                            const SizedBox(width: 24),
                          ],
                          if (isWrongAnswer) ...[
                            const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ] else ...[
                            const SizedBox(width: 24),
                          ],
                          SizedBox(width: 24),
                          Text(answer),
                        ],
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
