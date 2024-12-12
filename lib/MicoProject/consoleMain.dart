import 'dart:io';
import 'question.dart';
import 'participant.dart';
import 'quiz.dart';

void main() {
  // Create a quiz
  Quiz quiz = Quiz();
  Question question = SingleChoiceQuestion(
    "What is the capital of France?", 
    ["Paris", "London", "Berlin", "Madrid"], 
    1
  );
  // Add questions
  // quiz.addQuestion(SingleChoiceQuestion(
  //   "What is the capital of France?", 
  //   ["Paris", "London", "Berlin", "Madrid"], 
  //   1
  // ));
  quiz.addQuestion(question);

  quiz.addQuestion(MultipleChoiceQuestion(
    "Which of the following are programming languages?", 
    ["Python", "HTML", "CSS", "Java"], 
    [1, 4] 
  ));

  quiz.addQuestion(MultipleChoiceQuestion(
    "Which of the following are not programming languages?", 
    ["Python", "HTML", "PSPP", "Java"], 
    [2, 3] 
  ));

  // Get participant details
  print("Enter your first name:");
  String? firstName = stdin.readLineSync();

  print("Enter your last name:");
  String? lastName = stdin.readLineSync();

  // Create a participant
  Participant participant = Participant(firstName ?? "Unknown", lastName ?? "Unknown");

  // Start the quiz
  quiz.startQuiz(participant);

  // Display participant's result
  quiz.displayResults(participant);


    // Get participant details
  print("Enter your first name:");
  String? firstName2 = stdin.readLineSync();

  print("Enter your last name:");
  String? lastName2 = stdin.readLineSync();

  // Create a participant
  Participant participant2 = Participant(firstName2 ?? "Unknown", lastName2 ?? "Unknown");

  // Start the quiz
  quiz.startQuiz(participant2);

  // Display participant's result
  quiz.displayResults(participant2);
}
