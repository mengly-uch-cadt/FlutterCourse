import 'package:flutter/material.dart';
import 'package:practice/MicroProject2/lib/screens/login_screen.dart';
import 'package:practice/MicroProject2/lib/screens/question_screen.dart';
import 'package:practice/MicroProject2/lib/screens/signup_screen.dart';
import 'package:practice/MicroProject2/lib/screens/welcome_screen.dart';
// import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;
enum Screen {
  login,
  signup,
  welcome,
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
        return WelcomeScreen(onStartQuiz: () => changeScreen(Screen.quiz),);
      case Screen.quiz:
        return QuestionScreen();
      case Screen.result:
        return Container();
    }
  }

  changeScreen(Screen newScreen) {
    setState(() {
      screen = newScreen;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: currentScreen(),
      ),
    );
  }
}
