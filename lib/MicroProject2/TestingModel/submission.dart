import 'package:practice/MicroProject2/TestingModel/quiz.dart';
import 'package:uuid/uuid.dart';
import 'package:mysql1/mysql1.dart';
import 'participant.dart';

class Submission {
  static Uuid uuid = const Uuid();
  final String submissionId;
  final Participant participant;
  final Map<String, int> answers = {}; // questionId -> answerId

  Submission(this.participant) : submissionId = Submission.uuid.v4();

  void addAnswer(String questionId, int answer) {
    answers[questionId] = answer;
  }

  void removeAnswer(String questionId) {
    answers.remove(questionId);
  }

  int getScore() {
    // Calculate the score for the submission based on correct answers
    return answers.length; // Replace with your actual logic
  }

  // Save the Submission to the database
  Future<void> saveToDatabase(MySqlConnection connection, Quiz quiz) async {
     // Insert submission
    await connection.query(
      'INSERT INTO submissions (submission_id, quiz_id, participant_id) VALUES (?, ?, ?)',
      [submissionId, quiz.quizId, participant.participantId], // Replace 'your-quiz-id' with actual quiz ID
    );
    for (var entry in answers.entries) {
      await connection.query(
        'INSERT INTO submission_answers (submission_id, question_id, answer) VALUES (?, ?, ?)',
        [submissionId, entry.key, entry.value],
      );
    }
  }
}
