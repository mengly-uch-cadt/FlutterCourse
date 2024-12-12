import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/screens/choose_quiz_screen.dart';
import 'package:practice/MicroProject2/lib/screens/login_screen.dart';
import 'package:practice/MicroProject2/lib/screens/question_screen.dart';
import 'package:practice/MicroProject2/lib/screens/result_screen.dart';
import 'package:practice/MicroProject2/lib/screens/signup_screen.dart';
import 'package:practice/MicroProject2/lib/screens/welcome_screen.dart';
// import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;
enum Screen {
  login,
  signup,
  welcome,
  chooseQuiz,
  quiz,
  result
}

Screen screen = Screen.welcome;
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Screen screen = Screen.login;
  List<String> questionsId = [];

  currentScreen() {
    switch (screen) {
      case Screen.login:
        return LoginScreen(
          onLoginSuccess: () => changeScreen(Screen.welcome), 
          onSignUp: () => changeScreen(Screen.signup),
        );
      case Screen.signup:
        return SignupScreen(
          onSignupSuccess: () => changeScreen(Screen.welcome),
          onLogin: () => changeScreen(Screen.login),
        );
      case Screen.welcome:
        return WelcomeScreen(
          onStartQuiz: () => changeScreen(Screen.chooseQuiz),
        );
      case Screen.chooseQuiz:
        return ChooseQuizScreen(
          onChooseQuiz: onChooseQuiz,
        );
      case Screen.quiz:
        return QuestionScreen(
          questionsId: questionsId, 
          onFinishQuiz: () => changeScreen(Screen.result)
        );
      case Screen.result:
        return ResultScreen(onBack: () => changeScreen(Screen.quiz),);
    }
  }

  changeScreen(Screen newScreen) {
    setState(() {
      screen = newScreen;
    });
  }

  onChooseQuiz(List<String> questions_id) {
    this.questionsId = questions_id;
    changeScreen(Screen.quiz);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: currentScreen(),
    );
  }
}
