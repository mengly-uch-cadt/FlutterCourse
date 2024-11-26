import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/answer.dart';

// Save an answer to the database
Future<void> saveAnswer(MySqlConnection connection, Answer answer) async {
  await connection.query(
    'INSERT INTO answers (answer_id, question_id, answer) VALUES (?, ?, ?)',
    [answer.answerId, answer.questionId, answer.answer],
  );
}

// Retrieve all answers for a specific question ID
Future<List<Answer>> getAnswersByQuestionId(MySqlConnection connection, String questionId) async {
  List<Answer> answers = [];
  final results = await connection.query(
    'SELECT * FROM answers WHERE question_id = ?',
    [questionId],
  );
  for (var row in results) {
    answers.add(Answer.fromDatabase(row.fields));
  }
  return answers;
}

// Retrieve all answers from the database
Future<List<Answer>> getAllAnswers(MySqlConnection connection) async {
  List<Answer> answers = [];
  final results = await connection.query('SELECT * FROM answers');
  for (var row in results) {
    answers.add(Answer.fromDatabase(row.fields));
  }
  return answers;
}

