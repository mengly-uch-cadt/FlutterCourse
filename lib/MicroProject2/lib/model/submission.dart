import 'package:uuid/uuid.dart';
import 'participant.dart';

class Submission {
  static const Uuid uuid = Uuid();
  final String submissionId;
  final Participant participant;
  final Map<String, String> answers = {}; // questionId -> answer

  Submission(this.participant) : submissionId = Submission.uuid.v4();

  // Named constructor for initializing from a database row
  Submission.fromDatabase(Map<String, dynamic> row, this.participant)
      : submissionId = row['submission_id'];

  // Add an answer to the submission
  void addAnswer(String questionId, String answer) {
    answers[questionId] = answer;
  }

  // Remove an answer from the submission
  void removeAnswer(String questionId) {
    answers.remove(questionId);
  }

  // Get the total score (dummy implementation, replace with real logic)
  int getScore() {
    return answers.length; // Replace with actual scoring logic
  }
}
