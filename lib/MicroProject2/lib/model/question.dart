import 'package:uuid/uuid.dart';
import 'dart:convert';

class Question {
  static const Uuid uuid = Uuid();
  final String questionId;
  final String title;
  List<String> possibleAnswers = [];
  String goodAnswer = '';

  Question(this.title) : questionId = Question.uuid.v4();

  // Named constructor for initializing from database row
  Question.fromDatabase(Map<String, dynamic> row)
      : questionId = row['question_id'],
        title = row['title'],
        possibleAnswers = jsonDecode(row['possible_answers']) as List<String>,
        goodAnswer = row['good_answer'];
}
