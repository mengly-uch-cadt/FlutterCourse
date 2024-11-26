import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/participant.dart';
import 'package:practice/MicroProject2/lib/model/quiz.dart';
import 'package:practice/MicroProject2/lib/model/submission.dart';

// Save a Submission to the database
Future<void> saveSubmission(MySqlConnection connection, Submission submission, Quiz quiz) async {
  // Insert submission record
  await connection.query(
    'INSERT INTO submissions (submission_id, quiz_id, participant_id) VALUES (?, ?, ?)',
    [submission.submissionId, quiz.quizId, submission.participant.participantId],
  );

  // Insert submission answers
  for (var entry in submission.answers.entries) {
    await connection.query(
      'INSERT INTO submission_answers (submission_id, question_id, answer) VALUES (?, ?, ?)',
      [submission.submissionId, entry.key, entry.value],
    );
  }
}

// Retrieve a Submission by its ID
Future<Submission?> getSubmissionById(MySqlConnection connection, String submissionId, Participant participant) async {
  final result = await connection.query(
    'SELECT * FROM submissions WHERE submission_id = ?',
    [submissionId],
  );

  if (result.isEmpty) {
    return null;
  }

  final submissionRow = result.first.fields;
  final submission = Submission.fromDatabase(submissionRow, participant);

  // Retrieve answers for the submission
  final answersResult = await connection.query(
    'SELECT question_id, answer FROM submission_answers WHERE submission_id = ?',
    [submissionId],
  );

  for (var row in answersResult) {
    submission.addAnswer(row['question_id'], row['answer']);
  }

  return submission;
}

// Retrieve all Submissions for a specific quiz
Future<List<Submission>> getSubmissionsByQuiz(
  MySqlConnection connection,
  Quiz quiz,
  List<Participant> participants,
) async {
  List<Submission> submissions = [];

  // Query submissions for the specified quiz
  final results = await connection.query(
    'SELECT * FROM submissions WHERE quiz_id = ?',
    [quiz.quizId],
  );

  for (var row in results) {
    // Find the participant for this submission
    final participant = participants.firstWhere(
      (p) => p.participantId == row['participant_id'],
      orElse: () => throw Exception(
          "Participant not found for submission ID ${row['submission_id']}"),
    );

    // Retrieve the full submission, including its answers
    final submission = await getSubmissionById(
      connection, // Pass the database connection
      row['submission_id'],
      participant,
    );

    if (submission != null) {
      submissions.add(submission);
    }
  }

  return submissions;
}
