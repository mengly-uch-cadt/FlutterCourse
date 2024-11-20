import 'package:flutter/material.dart';
import 'package:practice/W6-S2/EXERCISE-4/jokes.dart';

Color appColor = Colors.green[300] as Color;

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.joke,
    required this.index,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  final Joke joke;
  final int index;
  final bool isFavorite;  // To track if this joke is the favorite
  final Function(int) onFavoriteClick;  // Callback to notify parent of favorite change

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          // Wrap the text in an Expanded widget to take up remaining space
          Expanded(
            flex: 7, // Takes up most of the space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.setup,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.punchline),
              ],
            ),
          ),
          // The icon stays on the right side
          IconButton(
            onPressed: () {
              onFavoriteClick(index);  // Notify parent on click
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
