import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF7FF),
      appBar: AppBar(
        title: const Text("Custom Buttons"),
      ),
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: "Submit",icon: Icons.check, position: Position.left, type: ButtonType.primary,),
              CustomButton(label: "Time",icon: Icons.schedule, position: Position.right, type: ButtonType.secondary,),
              CustomButton(label: "Account",icon: Icons.account_tree, position: Position.right, type: ButtonType.disabled,)
            ],
          ),
        )
    );
  }
}

enum Position { left, right }
enum ButtonType {
  primary(Colors.blue), 
  secondary(Colors.green), 
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label, 
    required this.icon, 
    this.position = Position.left,
    this.type     = ButtonType.primary,
    super.key
    });

  final String label;
  final IconData icon; 
  final Position position;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: type.color,
      ),
      child: TextButton(
        onPressed: type == ButtonType.disabled ? null : (){ 
          print("Button Disable");
        }, 
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust padding as needed
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            position == Position.left ? Row( children: [Icon(icon), const SizedBox(width: 10,)],): const SizedBox.shrink(),
            Text(label),
            position == Position.right ? Row( children: [ const SizedBox(width: 10,),Icon(icon)],): const SizedBox.shrink(),
          ],
        )
      )
    );
  }
}