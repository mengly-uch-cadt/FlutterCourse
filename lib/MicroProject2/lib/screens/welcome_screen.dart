import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/MicroProject2/lib/state/participant_state.dart';
import 'package:practice/MicroProject2/lib/widgets/app_button.dart';
Color appColor = Colors.blue[500] as Color;

 class WelcomeScreen extends ConsumerStatefulWidget {
  final VoidCallback onStartQuiz;
  const WelcomeScreen({super.key, required this.onStartQuiz});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Crazy Quiz"),
        centerTitle: true,
      ),
      backgroundColor: appColor,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) { 
          final participant = ref.watch(participantProvider);
          return SingleChildScrollView(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/microproject2/quiz-logo.png'),
                    const SizedBox(height: 20),
                    const Text("Crazy Quiz", style: TextStyle(fontSize: 30, color: Colors.white)),
                    const SizedBox(height: 20),
                    Text( participant == null ? "Welcome Guest !!!" :
                      "Welcome:  ${participant.firstName} ${participant.lastName} !!!", 
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 20,
                      )
                    ),
                    const SizedBox(height: 20),
                    // ignore: prefer_const_constructors
                    AppButton("Start Quiz", icon: Icons.arrow_right_alt, onTap: widget.onStartQuiz), 
                  ],
                ),
              ),
          );
         },
      ),
    );
  }
}
 
