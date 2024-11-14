import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // This line removes the debug banner
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image Viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: () {
                // This will call the previous image function in MyWidget
                MyWidget.of()?.showPreviousImage();
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () {
                // This will call the next image function in MyWidget
                MyWidget.of()?.showNextImage();
              },
            ),
          ],
        ),
        body: const MyWidget(),
      ),
    ));

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  static _MyWidgetState? of() => _myWidgetState;

  @override
  State<MyWidget> createState() {
    _myWidgetState = _MyWidgetState();
    return _myWidgetState!;
  }
}

_MyWidgetState? _myWidgetState;

class _MyWidgetState extends State<MyWidget> {
  int _currentIndex = 0;

  void showNextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  void showPreviousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(images[_currentIndex]),
    );
  }
}
