import 'package:practice/MicroProject2/lib/database/database.dart';
import 'quiz.dart';
import 'question.dart';
import 'answer.dart';
import 'submission.dart';
import 'participant.dart';
import 'package:practice/MicroProject2/lib/util/participant_util.dart';

Future<void> main() async {
  // Step 1: Establish a database connection
  final connection = await Database.connect();

  try {
    // Step 2: Add a participant
    Participant participant = Participant("John3", "Doe3", "012000003", "password");
    await saveParticipant(connection, participant);
    print("Participant saved: ${participant.participantId}");

    // // Step 3: Add a quiz
    // Quiz quiz = Quiz("General Knowledge Quiz");
    // await quiz.saveToDatabase(connection);
    // print("Quiz saved: ${quiz.quizId}");

    // // Step 4: Add questions and save them to the database
    // Question question1 = Question("What is the capital of France?");
    // question1.possibleAnswers = ["Paris", "Berlin", "Madrid"];
    // question1.goodAnswer = "Paris";
    // await question1.saveToDatabase(connection);

    // Question question2 = Question("What is 2 + 2?");
    // question2.possibleAnswers = ["3", "4", "5"];
    // question2.goodAnswer = "4";
    // await question2.saveToDatabase(connection);

    // print("Questions saved: ${question1.questionId}, ${question2.questionId}");

    // // Link questions to the quiz
    // quiz.addQuestion(question1.questionId);
    // quiz.addQuestion(question2.questionId);
    // await quiz.saveQuestionsToDatabase(connection);
    // print("Quiz questions linked.");

    // // Step 5: Add answers
    // Answer answer1 = Answer(questionId: question1.questionId, answer: "Paris");
    // Answer answer2 = Answer(questionId: question2.questionId, answer: "4");
    // await answer1.saveToDatabase(connection);
    // await answer2.saveToDatabase(connection);
    // print("Answers saved.");

    // // Step 6: Add a submission
    // Submission submission = Submission(participant);
    // submission.addAnswer(question1.questionId, "Paris"); // User selected "Paris"
    // submission.addAnswer(question2.questionId, "4");     // User selected "4"
    // await submission.saveToDatabase(connection, quiz);
    // print("Submission saved: ${submission.submissionId}");

    // // Step 7: Verify data
    // print("Data successfully added to the database.");

    // // Step 8: Retrieve and print all participants
    // List<Participant> participants = await getAllParticipants(connection);
    // print("All Participants:");
    // for (var participant in participants) {
    //   print("ID: ${participant.participantId}, Name: ${participant.firstName} ${participant.lastName}, "
    //       "Phone: ${participant.phoneNumber}, Password: ${participant.hashedPassword}");
    // }

    // Optional: Retrieve and print submissions (if retrieval logic is implemented)
    // SubmissionUtil submissionUtil = SubmissionUtil(connection);
    // var submissions = await submissionUtil.getSubmissionsByQuiz(quiz, participants);
    // print("Submissions for quiz: ${quiz.title}");
    // for (var submission in submissions) {
    //   print("Submission ID: ${submission.submissionId}, Participant: ${submission.participant.firstName}, "
    //       "Answers: ${submission.answers}");
    // }

  } catch (e) {
    print("Error occurred: $e");
  } finally {
    await connection.close();
    print("Database connection closed.");
  }
}
