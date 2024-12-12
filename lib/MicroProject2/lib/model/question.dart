import 'package:uuid/uuid.dart';

class Question {
  static const Uuid uuid = Uuid();
  final String questionId;
  final String title;
  List<String> possibleAnswers = [];
  String goodAnswer = '';

  Question({required this.title, required this.possibleAnswers, required this.goodAnswer}) : questionId = Question.uuid.v4();

  // Named constructor for initializing from database row
  Question.fromDatabase(Map<String, dynamic> row, List<String> possibleAnswersList)
      : questionId = row['question_id'],
        title = row['title'],
        goodAnswer = row['good_answer'],
        possibleAnswers = possibleAnswersList;
}
