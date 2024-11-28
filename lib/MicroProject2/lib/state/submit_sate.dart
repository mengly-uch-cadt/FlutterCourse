import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmitNotifier extends StateNotifier<  List<Map<String, String>>> {
  SubmitNotifier() : super([]); // Start with an empty list

  void saveSubmission(  List<Map<String, String>> questionAnswers) {
    state = questionAnswers;
  }

  void clearQuiz() {
    state = [];
  }
}

final submitProvider = StateNotifierProvider<SubmitNotifier,  List<Map<String, String>>>(
  (ref) => SubmitNotifier(),
);
