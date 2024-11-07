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
