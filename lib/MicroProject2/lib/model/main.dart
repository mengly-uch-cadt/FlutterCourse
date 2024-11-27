import 'package:practice/MicroProject2/lib/database/database.dart';
import 'package:practice/MicroProject2/lib/model/answer.dart';
import 'package:practice/MicroProject2/lib/model/participant.dart';
import 'package:practice/MicroProject2/lib/model/question.dart';
import 'package:practice/MicroProject2/lib/model/quiz.dart';
import 'package:practice/MicroProject2/lib/model/submission.dart';
import 'package:practice/MicroProject2/lib/util/participant_util.dart';
import 'package:practice/MicroProject2/lib/util/quiz_util.dart';
import 'package:practice/MicroProject2/lib/util/submission_util.dart';

Future<void> main() async {
  // Step 1: Establish a database connection
  final connection = await Database.connect();

  try {
    // Participants
    List<Participant> participants = [
      Participant(firstName: "John", lastName: "Doe", phoneNumber: "012000001", password: "password"),
      Participant(firstName: "Jane", lastName: "Smith", phoneNumber: "012000002", password: "password"),
      Participant(firstName: "Jane", lastName: "Jack", phoneNumber: "012000003", password: "password"),
    ];

    for (Participant participant in participants) {
      // participant.hashedPassword = hashPassword(participant.hashedPassword);
      await saveParticipant(connection, participant);
    }
    // ignore: avoid_print
    print("Participants saved successfully.");
    // Question 
    List<Question> questions = [
      Question(title: "What is the capital of France?", possibleAnswers: ["Paris", "London", "Berlin", "Madrid"], goodAnswer: "Paris"),
      Question(title: "What is the capital of Spain?", possibleAnswers: ["Paris", "London", "Berlin", "Madrid"], goodAnswer: "Madrid"),
      Question(title: "What is the capital of Germany?", possibleAnswers: ["Paris", "London", "Berlin", "Madrid"], goodAnswer: "Berlin"),
      Question(title: "What is the capital of Cambodia?", possibleAnswers: ["Paris", "London", "Phnom Penh", "Madrid"], goodAnswer: "Phnom Penh"),
    ];
    Quiz quiz = Quiz(title: "Countries and Capitals");
    await saveQuiz(connection, quiz, questions);
    // ignore: avoid_print
    print("Quiz saved successfully.");

    // Step 1: Create a list of new questions with different data
    List<Question> questions2 = [
      Question(title: "What is the capital of Japan", possibleAnswers: ["Tokyo", "Kyoto", "Osaka", "Hokkaido"], goodAnswer : "Tokyo",),
      Question(title: "What is the largest desert in the world?", possibleAnswers: ["Sahara", "Gobi", "Kalahari", "Antarctic"], goodAnswer : "Antarctic",),
      Question(title: "What is the smallest country in the world?", possibleAnswers: ["Vatican City", "Monaco", "San Marino", "Liechtenstein"], goodAnswer : "Vatican City",),
      Question(title: "What is the longest river in the world?", possibleAnswers: ["Amazon", "Nile", "Yangtze", "Ganges"], goodAnswer : "Nile",),
    ];

    // Step 2: Create a new quiz with a different title
    Quiz quiz2 = Quiz(title: "Geography and Wonders");

    // Step 3: Save the quiz with questions to the database
    await saveQuiz(connection, quiz2, questions2);
    // ignore: avoid_print
    print("Quiz2 saved successfully.");

    // Submission
    // Assuming the participant with ID 1 took the quiz with ID 1 and answered the questions
    List<Answer> answers = [
      Answer(questionId: questions[0].questionId, answer: "Paris"),
      Answer(questionId: questions[1].questionId, answer: "London"),
      Answer(questionId: questions[2].questionId, answer: "Berlin"),
      Answer(questionId: questions[3].questionId, answer: "Phnom Penh"),
    ];
    Submission submission = Submission(quizId: quiz.quizId, participantId: participants[0].participantId);
    await saveSubmission(connection, submission, answers);
    // ignore: avoid_print
    print("Submission saved successfully.");

  } catch (e) {
    // ignore: avoid_print
    print("Error occurred: $e");
  } finally {
    await connection.close();
    // ignore: avoid_print
    print("Database connection closed.");
  }
}
