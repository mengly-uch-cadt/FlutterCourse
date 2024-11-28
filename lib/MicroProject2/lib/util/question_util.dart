import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/question.dart'; // For handling Blob data

Future<List<Question>> getAllQuestionsByQuizId(
    MySqlConnection connection, List<String> questionsId) async {
  List<Question> questions = [];
  for (var id in questionsId) {
    final results = await connection.query(
      'SELECT * FROM questions WHERE question_id = ?',
      [id],
    );

    final questionId = results.first.fields['question_id'].toString();
    final title = results.first.fields['title'].toString();
    final possibleAnswersRaw = results.first.fields['possible_answers'];
    final goodAnswer = results.first.fields['good_answer'].toString();

    final possibleAnswersString = possibleAnswersRaw.toString();
    // Split the string into a list of answers
    final List<String> possibleAnswers = possibleAnswersString.split(',');

    final question = Question.fromDatabase({'question_id': questionId,'title': title,'good_answer': goodAnswer}, possibleAnswers);
    questions.add(question);
  }
  return questions;
}
