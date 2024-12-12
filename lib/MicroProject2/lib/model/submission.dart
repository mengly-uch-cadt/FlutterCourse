import 'package:uuid/uuid.dart';

class Submission {
  static const Uuid uuid = Uuid();
  final String submissionId;
  final String quizId;
  final String participantId;
  final List<String> answersId; 

  // Constructor for creating a new submission
  Submission({required this.quizId, required this.participantId}) 
    : submissionId = Submission.uuid.v4(), 
    answersId = [];

  Submission.fromDatabase(Map<String, dynamic> row, this.participantId, this.quizId)
      : submissionId = row['submission_id'],
        answersId = [];

  // Get the total score (dummy implementation, replace with real logic)
  int getScore() {
    return answersId.length; // Replace with actual scoring logic
  }
}
