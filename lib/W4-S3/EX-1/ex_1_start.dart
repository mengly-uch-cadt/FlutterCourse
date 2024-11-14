import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        // body: Center(child: MyButton()),
        body: const Column(
          children: [
            MyButton(),
            SizedBox(height: 20),
            MyButton(),
            SizedBox(height: 20),
            MyButton(),
          ],
        ),
      ),
    )
  );


class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;
  
  void toggleSelection(){
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override


  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, 
      height: 100,
      child: ElevatedButton(
        onPressed: toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50],
        ),
        child: Center(
          child: Text(
            isSelected ? "Selected" : "Not Selected", 
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}