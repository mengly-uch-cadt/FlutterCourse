import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/MicroProject2/lib/model/quiz.dart';

class QuizNotifier extends StateNotifier<List<Quiz>> {
  QuizNotifier() : super([]); // Start with an empty list

  void addQuiz(List<Quiz> quizzes) {
    state = quizzes;
  }

  void clearQuiz() {
    state = [];
  }
}

final quizProvider = StateNotifierProvider<QuizNotifier, List<Quiz>>(
  (ref) => QuizNotifier(),
);
