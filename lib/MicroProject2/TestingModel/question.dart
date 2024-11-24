import 'package:uuid/uuid.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:convert';

class Question {
  static const Uuid uuid = Uuid();
  final String questionId;
  final String title;
  List<String> possibleAnswers = [];
  String goodAnswer = '';

  Question(this.title) : questionId = Question.uuid.v4();

  // Save the Question to the database
  Future<void> saveToDatabase(MySqlConnection connection) async {
    String possibleAnswersString = jsonEncode(possibleAnswers);
    await connection.query(
      'INSERT INTO questions (question_id, title, possible_answers, good_answer) VALUES (?, ?, ?, ?)',
      [questionId, title, possibleAnswersString, goodAnswer],
    );
  }
}
