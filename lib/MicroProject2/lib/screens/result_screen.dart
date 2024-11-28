import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/quiz_app.dart';
import 'package:practice/MicroProject2/lib/state/question_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/MicroProject2/lib/state/submit_sate.dart';
import 'package:practice/MicroProject2/lib/widgets/show_result.dart';
class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the question data from the provider
    final questions = ref.watch(questionProvider);
    final questionsAnswers = ref.watch(submitProvider); // This will give you the map of questionId -> userAnswer
    int orderQuestion = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      backgroundColor: appColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'You have completed the quiz!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Loop through questions and display results
                ...questions!.map((question) {
                  // Find the user answer corresponding to the current questionId
                  final userAnswer = questionsAnswers
                      .firstWhere(
                        (answer) => answer['questionId'] == question.questionId,
                        orElse: () => {'answer': ''}, // Provide a default empty answer if not found
                      )['answer'];

                  // Display the question and the result
                  return ShowResult(
                    question: question,
                    orderQuestion: orderQuestion++, 
                    userAnswer: userAnswer ?? '',
                  );
                }),
                ElevatedButton(
                  onPressed: onBack,
                  child: const Text('Restart Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
