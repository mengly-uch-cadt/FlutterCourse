import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/answer.dart';
import 'package:practice/MicroProject2/lib/model/submission.dart';

Future<Submission> saveSubmission(MySqlConnection connection, Submission submission, List<Answer> answers) async {
  List<String> listAnswersId = [];
  for (var answer in answers) {
    await connection.query(
      'INSERT INTO answers (answer_id, question_id, answer) VALUES (?, ?, ?)',
      [answer.answerId, answer.questionId, answer.answer],
    );
    listAnswersId.add(answer.answerId);
  }
  // Store the submission with the list of answer IDs
  await connection.query(
    'INSERT INTO submissions (submission_id, quiz_id, participant_id, answers_id) VALUES (?, ?, ?, ?)',
    [submission.submissionId, submission.quizId, submission.participantId, listAnswersId.join(',')],
  );

  return submission;
}