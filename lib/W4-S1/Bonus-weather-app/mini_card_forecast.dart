import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice/W4-S1/Bonus-weather-app/stat/stat.dart';

class MiniCardForecast extends StatelessWidget {
  const MiniCardForecast({
    required this.temperature,
    required this.city,
    super.key
  });
  final String temperature;
  final City city;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$temperature°C", style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 10,),
                Text(city.displayCity.toString(), style: const TextStyle(fontSize: 20),),
              ],
            ),
          )
        ),
      ),
    );
  }
}