import 'package:uuid/uuid.dart';

class Quiz {
  static const Uuid uuid = Uuid();
  final String quizId;
  final String title;
  final List<String> questionsId;

  // Constructor for creating a new Quiz
  Quiz({required this.title})
      : quizId = Quiz.uuid.v4(),
        questionsId = [];

   // Named constructor for initializing from database row and associated questions
  Quiz.fromDatabase(Map<String, dynamic> row, List<String> associatedQuestions)
      : quizId = row['quiz_id'],
        title = row['title'],
        questionsId = associatedQuestions;

  // Add a question to the quiz
  void addQuestion(String questionId) {
    questionsId.add(questionId);
  }
}
