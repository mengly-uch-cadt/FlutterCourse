import 'package:mysql1/mysql1.dart';
import 'dart:convert';
import 'package:practice/MicroProject2/lib/model/question.dart';

// Save the Question to the database
Future<void> saveQuestion(MySqlConnection connection, Question question) async {
  String possibleAnswersString = jsonEncode(question.possibleAnswers);
  await connection.query(
    'INSERT INTO questions (question_id, title, possible_answers, good_answer) VALUES (?, ?, ?, ?)',
    [question.questionId, question.title, possibleAnswersString, question.goodAnswer],
  );
}

// Retrieve all questions from the database
Future<List<Question>> getAllQuestions(MySqlConnection connection) async {
  List<Question> questions = [];
  final results = await connection.query('SELECT * FROM questions');
  for (var row in results) {
    questions.add(Question.fromDatabase(row.fields));
  }
  return questions;
}

// Retrieve a specific question by ID
Future<Question?> getQuestionById(MySqlConnection connection, String questionId) async {
  final results = await connection.query(
    'SELECT * FROM questions WHERE question_id = ?',
    [questionId],
  );
  if (results.isNotEmpty) {
    return Question.fromDatabase(results.first.fields);
  }
  return null; // Return null if no question is found
}

