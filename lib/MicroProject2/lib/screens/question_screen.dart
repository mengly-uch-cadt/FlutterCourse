import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/database/database.dart';
import 'package:practice/MicroProject2/lib/model/answer.dart';
import 'package:practice/MicroProject2/lib/model/submission.dart';
import 'package:practice/MicroProject2/lib/state/participant_state.dart';
import 'package:practice/MicroProject2/lib/state/question_state.dart';
import 'package:practice/MicroProject2/lib/state/quiz_state.dart';
import 'package:practice/MicroProject2/lib/state/submit_sate.dart';
import 'package:practice/MicroProject2/lib/util/question_util.dart';
import 'package:practice/MicroProject2/lib/util/submission_util.dart';
import 'package:practice/MicroProject2/lib/widgets/show_question.dart';

Color appColor = Colors.blue[500] as Color;

class QuestionScreen extends ConsumerStatefulWidget {
  final VoidCallback onFinishQuiz;
  final List<String> questionsId;
  const QuestionScreen( {super.key, required this.questionsId, required this.onFinishQuiz});

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  MySqlConnection? connection;
  int currentQuestion = 0; // To keep track of the current question
  List<Map<String, String>> questionAnswers = [];
  Map<String, String> selectedAnswers = {}; // To store selected answers for each question

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

  void onAnswerSelected(String questionId, String answer) {
    selectedAnswers[questionId] = answer; 
    final existingAnswerIndex = questionAnswers.indexWhere((qa) => qa['questionId'] == questionId);
    if (existingAnswerIndex != -1) {
      questionAnswers[existingAnswerIndex]['answer'] = answer;
    } else {
      questionAnswers.add({'questionId': questionId, 'answer': answer});
    }
  }

  void onSubmit(){
    final participant = ref.read(participantProvider);
    final quiz = ref.read(selectQuizProvider);
    final submission = Submission(participantId: participant!.participantId, quizId: quiz!.quizId);
    // List<String> answers = questionAnswers.map((qa) => qa.values.first).toList();
    List<Answer> answers = questionAnswers.map((qa) => Answer(questionId: qa['questionId']!, answer: qa['answer']!)).toList();
    ref.read(submitProvider.notifier).saveSubmission(questionAnswers);

    saveSubmission(connection!, submission, answers);
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
                    key: ValueKey(currentQuestion), 
                    question: questions[currentQuestion],
                    orderQuestion: currentQuestion + 1, 
                    selectedAnswer: selectedAnswers[questions[currentQuestion].questionId], 
                    onAnswer: (String answer) {
                     onAnswerSelected(questions[currentQuestion].questionId, answer);
                    },
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
                            onSubmit();
                            widget.onFinishQuiz();
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
