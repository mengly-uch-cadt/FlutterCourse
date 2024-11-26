import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/quiz.dart';

class QuizUtil {
  final MySqlConnection connection;

  QuizUtil(this.connection);

  // Save a quiz to the database
  Future<void> saveQuiz(Quiz quiz) async {
    // Insert into the quizzes table
    await connection.query(
      'INSERT INTO quizzes (quiz_id, title) VALUES (?, ?)',
      [quiz.quizId, quiz.title],
    );

    // Insert questions into quiz_questions table
    for (String questionId in quiz.questionsId) {
      await connection.query(
        'INSERT INTO quiz_questions (quiz_id, question_id) VALUES (?, ?)',
        [quiz.quizId, questionId],
      );
    }
  }

  // Retrieve all quizzes and their associated questions
  Future<List<Quiz>> getAllQuizzes() async {
    List<Quiz> quizzes = [];

    // Fetch all quizzes
    final quizResults = await connection.query('SELECT * FROM quizzes');

    for (var quizRow in quizResults) {
      // Fetch associated questions for this quiz
      final questionResults = await connection.query(
        'SELECT question_id FROM quiz_questions WHERE quiz_id = ?',
        [quizRow['quiz_id']],
      );

      List<String> associatedQuestions = questionResults
          .map((questionRow) => questionRow['question_id'] as String)
          .toList();

      // Create the Quiz object with associated questions
      quizzes.add(Quiz.fromDatabase(quizRow.fields, associatedQuestions));
    }

    return quizzes;
  }

  // Retrieve a specific quiz by ID and its associated questions
  Future<Quiz?> getQuizById(String quizId) async {
    // Fetch the quiz
    final quizResults = await connection.query(
      'SELECT * FROM quizzes WHERE quiz_id = ?',
      [quizId],
    );

    if (quizResults.isNotEmpty) {
      final quizRow = quizResults.first;

      // Fetch associated questions
      final questionResults = await connection.query(
        'SELECT question_id FROM quiz_questions WHERE quiz_id = ?',
        [quizRow['quiz_id']],
      );

      List<String> associatedQuestions = questionResults
          .map((questionRow) => questionRow['question_id'] as String)
          .toList();

      return Quiz.fromDatabase(quizRow.fields, associatedQuestions);
    }

    return null;
  }
}
