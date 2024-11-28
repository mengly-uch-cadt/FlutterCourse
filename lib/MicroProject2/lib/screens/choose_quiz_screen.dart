import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/database/database.dart';
import 'package:practice/MicroProject2/lib/state/quiz_state.dart';
import 'package:practice/MicroProject2/lib/util/quiz_util.dart';

Color appColor = Colors.blue[500] as Color;

class ChooseQuizScreen extends ConsumerStatefulWidget {
  final Function(List<String>) onChooseQuiz; // This callback now takes the quiz ID as a parameter
  const ChooseQuizScreen({required this.onChooseQuiz, super.key});

  @override
  ConsumerState<ChooseQuizScreen> createState() => _ChooseQuizScreenState();
}

class _ChooseQuizScreenState extends ConsumerState<ChooseQuizScreen> {
  MySqlConnection? connection;

  @override
  void initState() {
    super.initState();
    _initializeDatabaseAndFetchQuizzes();
  }

  Future<void> _initializeDatabaseAndFetchQuizzes() async {
    try {
      // Initialize the database connection
      connection = await Database.connect();

      // Fetch quizzes only after the connection is established
      if (connection != null) {
        final quizzes = await getAllQuizzes(connection!);

        // Update the state with the fetched quizzes
        ref.read(quizProvider.notifier).addQuiz(quizzes);
      }
    } catch (e) {
      const SnackBar(content: Text('Failed to fetch quizzes'));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the quizzes from the provider
    final quizzes = ref.watch(quizProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        centerTitle: true,
        title: const Text("Choose Quiz", style: TextStyle(fontSize: 30, color: Colors.white),),
      ),
      backgroundColor: appColor,
      body: quizzes.isEmpty
          ? const Center(
              child: CircularProgressIndicator(), // Show a loader while quizzes are loading
            )
          : ListView.builder(
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      quiz.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Questions: ${quiz.questionsId.length}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      ref.read(selectQuizProvider.notifier).selectQuiz(quiz);
                      widget.onChooseQuiz(quiz.questionsId);
                    },
                  ),
                );
              },
            ),
    );
  }
}
