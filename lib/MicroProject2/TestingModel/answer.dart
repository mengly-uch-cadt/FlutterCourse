import 'package:mysql1/mysql1.dart';
import 'package:uuid/uuid.dart';

class Answer {
  static const Uuid uuid = Uuid();
  final String answerId;
  final String questionId;
  final String answer;

  Answer({required this.questionId, required this.answer}) : answerId = Answer.uuid.v4();

  bool isCorrect(String userAnswer) {
    return userAnswer.trim().toLowerCase() == answer.trim().toLowerCase();
  }

  // Save the Answer to the database
  Future<void> saveToDatabase(MySqlConnection connection) async {
    await connection.query(
      'INSERT INTO answers (answer_id, question_id, answer) VALUES (?, ?, ?)',
      [answerId, questionId, answer],
    );
  }
}
