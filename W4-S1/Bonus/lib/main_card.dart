import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/stat/stat.dart';


class MainCard extends StatelessWidget {
  const MainCard({
    required this.temperature,
    required this.day, 
    required this.city,
    required this.image,
    super.key
  });

  final String temperature;
  final Day day;
  final City city;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$temperature°C", style: const TextStyle(fontSize: 50)),
                Text(day.displayDay.toString()),
                const SizedBox(height: 40,), 
                Text(city.displayCity.toString(), style: const TextStyle(fontSize: 20),)
              ],
            ),
            Column(
              children: [
                Image.asset("assets/$image.png", width: 150,)
              ],
            )
          ],
        ),
      ),
      )
    );
  }
}