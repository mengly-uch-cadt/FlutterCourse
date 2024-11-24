import 'package:uuid/uuid.dart';
import 'package:mysql1/mysql1.dart';

class Quiz {
  static const Uuid uuid = Uuid();
  final String quizId;
  final String title;
  final List<String> questionsId = [];

  Quiz(this.title) : quizId = Quiz.uuid.v4();

  void addQuestion(String questionId) {
    questionsId.add(questionId);
  }

  // Save the Quiz to the database
  Future<void> saveToDatabase(MySqlConnection connection) async {
    var result = await connection.query(
      'SELECT quiz_id FROM quizzes WHERE quiz_id = ?',
      [quizId],
    );

    if (result.isEmpty) {
      await connection.query(
      'INSERT INTO quizzes (quiz_id, title) VALUES (?, ?)',
      [quizId, title],
      );
    }
    for (String questionId in questionsId) {
      await connection.query(
        'INSERT INTO quiz_questions (quiz_id, question_id) VALUES (?, ?)',
        [quizId, questionId],
      );
    }
  }
}
