import 'database.dart';
import 'quiz.dart';
import 'question.dart';
import 'answer.dart';
import 'submission.dart';
import 'participant.dart';

Future<void> main() async {
  // Step 1: Establish a database connection
  final connection = await Database.connect();

  try {
    // // Step 2: Add a participant
    // Participant participant = Participant("John", "Doe", "012000001", "password");
    // await participant.saveToDatabase(connection);
    // print("Participant saved.");

    // // Step 3: Add a quiz
    // Quiz quiz = Quiz("General Knowledge Quiz");
    // await quiz.saveToDatabase(connection);
    // print("Quiz saved.");

    // // Step 4: Add questions
    // Question question1 = Question("What is the capital of France?");
    // Question question2 = Question("What is 2 + 2?");
    // await question1.saveToDatabase(connection);
    // await question2.saveToDatabase(connection);
    // print("Questions saved.");

    // // Link questions to the quiz
    // quiz.addQuestion(question1.questionId);
    // quiz.addQuestion(question2.questionId);
    // await quiz.saveToDatabase(connection);
    // print("Quiz questions linked.");

    // // Step 5: Add answers
    // Answer answer1 = Answer(questionId: question1.questionId, answer: "Paris");
    // Answer answer2 = Answer(questionId: question2.questionId, answer: "4");
    // await answer1.saveToDatabase(connection);
    // await answer2.saveToDatabase(connection);
    // print("Answers saved.");

    // // Step 6: Add a submission
    // Submission submission = Submission(participant);
    // submission.addAnswer(question1.questionId, 1); // User selected answer 1
    // submission.addAnswer(question2.questionId, 1); // User selected answer 1
    // await submission.saveToDatabase(connection, quiz);
    // print("Submission saved.");

    // // Step 7: Verify data
    // print("Data successfully added to the database.");

    // Step 8: Retrieve all participants
    // List<Participant> participants = await Participant.getAllParticipants(connection);
    // for (var participant in participants) {
    //   // print("ID: ${participant.participantId}, Name: ${participant.firstName} ${participant.lastName}");
    //   print("${participant.participantId}, ${participant.firstName}, ${participant.lastName}, ${participant.phoneNumber}, ${participant.hashedPassword}");
    // }


  } catch (e) {
    print("Error occurred: $e");
  } finally {
    await connection.close();
  }
}
