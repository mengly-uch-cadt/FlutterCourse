
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/MicroProject2/lib/model/question.dart';

class QuestionNotifier extends StateNotifier<List<Question>?> {
  QuestionNotifier() : super(null);

  // Add a question to the state
  void addQuestion(List<Question> questions) {
    state = questions; // Set the question as the new state
  }

  // Clear the question state
  void clearQuestion() {
    state = null;
  }
}

// Create a Riverpod provider
final questionProvider = StateNotifierProvider<QuestionNotifier, List<Question>?>(
        (ref) => QuestionNotifier());
