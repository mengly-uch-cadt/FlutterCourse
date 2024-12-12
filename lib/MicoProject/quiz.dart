import 'dart:io';
import 'question.dart';
import 'participant.dart';

// Quiz class
class Quiz {
  final List<Question> questions = [];

  void addQuestion(Question question) {
    questions.add(question);
  }

  void displayResults(Participant participant) {
    print("========================================");
    print('\nResults for ${participant.firstName} ${participant.lastName}:');
    double total = 0.0;
    var correctAnswerLenght;
    participant.results.forEach((question, score) {
      correctAnswerLenght = question is MultipleChoiceQuestion ? question.correctAnswers.length : 1;
      print('${question.title}: Score ${score}/$correctAnswerLenght');
      total += (score / correctAnswerLenght);
    });
    // take only 2 decimal places
    print('Total Score: ${total.toStringAsFixed(2)}');
    print("========================================");
  }

  // Method to start the quiz
  void startQuiz(Participant participant) {
    for (var question in questions) {
      question.displayQuestion();
      List<int> userAnswers = question.getUserAnswer();
      participant.addResult(question, question.checkAnswer(userAnswers));
    }
  }
}
