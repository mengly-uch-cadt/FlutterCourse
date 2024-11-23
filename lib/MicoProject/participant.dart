import 'question.dart';

// Participant class
class Participant {
  final String firstName;
  final String lastName;
  Map<Question, int> results = {}; // count of correct answers 
  // single and multiple choice questions are extended from Question class 
  // so we can use Question as key (tread as parent class)

  Participant(this.firstName, this.lastName);

  void addResult(Question question, int score) {
    results[question] = score;
  }
}