import 'dart:io';

// Abstract Question class
abstract class Question {
  final String title;
  final List<String> options;

  Question(this.title, this.options);

  // Method to check answer, to be implemented by subclasses
  int checkAnswer(List<int> answers);

  // Display the question and options
  void displayQuestion() {
    print("========================================");
    print("\n$title");
    for (int i = 1; i <= options.length; i++) {
      print("$i. ${options[i-1]}");
    }
  }

  // Get user input (to be implemented differently for Single/Multiple choice)
  List<int> getUserAnswer();
}

// Single Choice Question class
class SingleChoiceQuestion extends Question {
  final int correctAnswer;

  SingleChoiceQuestion(String title, List<String> options, this.correctAnswer) : super(title, options);

  @override
  int checkAnswer(List<int> answers) {
    return (answers.length == 1 && answers[0] == correctAnswer) ? 1 : 0;
  }

  @override
  List<int> getUserAnswer() {
    print("Enter the number of your choice (0-${options.length - 1}): ");
    try{
      String? input = stdin.readLineSync();
      int? answer = int.parse(input ?? '');
      return [answer];
    } catch (e) {
      print("Invalid input. Please enter a number.");
      return getUserAnswer();
    }
  }
}

// Multiple Choice Question class
class MultipleChoiceQuestion extends Question {
  final List<int> correctAnswers;

  MultipleChoiceQuestion(String title, List<String> options, this.correctAnswers) : super(title, options);

  @override
  int checkAnswer(List<int> answers) {
    // Count correct answers provided by the user
    int correctCount = answers.where((answer) => correctAnswers.contains(answer)).length;
    return correctCount; 
  }

  @override
  List<int> getUserAnswer() {
    print("Enter the numbers of your choices separated by commas => 0,2,3: ");
    try{
      String? input = stdin.readLineSync();
      List<int> answers = [];
      if (input != null) {
        answers = input.split(',').map((str) => int.parse(str.trim())).toList();
      }
      return answers;
    }catch(e){
      print("Invalid input. Please enter a number.");
      return getUserAnswer();
    }
  }
}