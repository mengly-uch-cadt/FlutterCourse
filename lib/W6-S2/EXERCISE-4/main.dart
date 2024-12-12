import 'package:flutter/material.dart';
import 'package:practice/W6-S2/EXERCISE-4/favorite_card.dart';
import 'package:practice/W6-S2/EXERCISE-4/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Track the index of the currently favored joke
  int? favoriteJokeIndex;

  // Callback function to update favorite joke
  void _setFavoriteJoke(int index) {
    setState(() {
      // If the clicked joke is already the favorite, we do nothing
      if (favoriteJokeIndex == index) {
        favoriteJokeIndex = null; // Deselect favorite
      } else {
        favoriteJokeIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: jokes.isEmpty
          ? const Center(child: Text("No jokes available"))
          : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return FavoriteCard(
                  joke: jokes[index],
                  index: index,
                  isFavorite: favoriteJokeIndex == index,
                  onFavoriteClick: _setFavoriteJoke,
                );
              },
            ),
    );
  }
}
