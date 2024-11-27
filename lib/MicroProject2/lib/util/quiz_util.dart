import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/question.dart';
import 'package:practice/MicroProject2/lib/model/quiz.dart';

Future<void> saveQuiz(MySqlConnection connection, Quiz quiz, List<Question> questions) async {
  List<String> listQuestionsId = []; 
  for (Question question in questions) {
    await connection.query(
      'INSERT INTO questions (question_id, title, possible_answers, good_answer) VALUES (?, ?, ?, ?)',
      [question.questionId, question.title, question.possibleAnswers.join(','), question.goodAnswer],
    );
    listQuestionsId.add(question.questionId);
  }
  // Insert into the quizzes table if it does not exist
  await connection.query(
    'INSERT INTO quizzes (quiz_id, title, questions_id) VALUES (?, ?, ?)',
    [quiz.quizId, quiz.title, listQuestionsId.join(',')],
  );

}

