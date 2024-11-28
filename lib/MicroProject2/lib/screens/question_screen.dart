import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/database/database.dart';
import 'package:practice/MicroProject2/lib/state/question_state.dart';
import 'package:practice/MicroProject2/lib/util/question_util.dart';
import 'package:practice/MicroProject2/lib/widgets/show_question.dart';

Color appColor = Colors.blue[500] as Color;

class QuestionScreen extends ConsumerStatefulWidget {
  final List<String> questionsId;
  const QuestionScreen({super.key, required this.questionsId});

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  MySqlConnection? connection;
  int currentQuestion = 0; // To keep track of the current question

  @override
  void initState() {
    super.initState();
    _initializeDatabaseAndFetchQuestions();
  }

  Future<void> _initializeDatabaseAndFetchQuestions() async {
    try {
      connection = await Database.connect();
      if (connection != null) {
        final questions = await getAllQuestionsByQuizId(connection!, widget.questionsId);
        ref.read(questionProvider.notifier).addQuestion(questions);
      }
    } catch (e) {
      const SnackBar(content: Text('Failed to fetch questions'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Enjoy your quiz!', style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
      backgroundColor: appColor,
      body: questions == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Show the current question
                  ShowQuestion(
                    question: questions[currentQuestion],
                    orderQuestion: currentQuestion + 1, // Displaying the question number (1-based index)
                  ),
                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Previous button
                      if (currentQuestion > 0)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[200],
                          ),
                          onPressed: () {
                            setState(() {
                              currentQuestion--;
                            });
                          },
                          child: const Text('Previous'),
                        ),
                      const SizedBox(width: 20),
                      // Next button
                      if (currentQuestion < questions.length - 1)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[200],
                          ),
                          onPressed: () {
                            setState(() {
                              currentQuestion++;
                            });
                          },
                          child: const Text('Next'),
                        ),
                      if (currentQuestion == questions.length - 1)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[200],
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Quiz completed!')),
                            );
                          },
                          child: const Text('Finish'),
                        )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
