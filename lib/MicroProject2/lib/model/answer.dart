import 'package:uuid/uuid.dart';

class Answer {
  static const Uuid uuid = Uuid();
  final String answerId;
  final String questionId;
  final String answer;

  Answer({required this.questionId, required this.answer}) : answerId = Answer.uuid.v4();

  // Named constructor for initializing from database row
  Answer.fromDatabase(Map<String, dynamic> row)
      : answerId = row['answer_id'],
        questionId = row['question_id'],
        answer = row['answer'];

  bool isCorrect(String questionAnswer) {
     return questionAnswer.trim().toLowerCase() == answer.trim().toLowerCase();
  }
}
