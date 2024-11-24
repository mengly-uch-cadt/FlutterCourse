import 'package:uuid/uuid.dart';
import 'package:mysql1/mysql1.dart';

class Question {
  static const Uuid uuid = Uuid();
  final String questionId;
  final String title;

  Question(this.title) : questionId = Question.uuid.v4();

  // Save the Question to the database
  Future<void> saveToDatabase(MySqlConnection connection) async {
    await connection.query(
      'INSERT INTO questions (question_id, title) VALUES (?, ?)',
      [questionId, title],
    );
  }
}
