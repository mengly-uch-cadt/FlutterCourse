import 'package:flutter/material.dart';
import 'package:practice/W4-S1/Bonus-weather-app/mini_card_forecast.dart';
import 'package:practice/W4-S1/Bonus-weather-app/stat/stat.dart';

class CityForecastCard extends StatelessWidget {
  const CityForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MiniCardForecast(temperature: "16", city: City.austin),
              MiniCardForecast(temperature: "25", city: City.charlotte),
              MiniCardForecast(temperature: "30", city: City.columbus),
              MiniCardForecast(temperature: "26", city: City.dallas),
              MiniCardForecast(temperature: "7", city: City.denver),
              MiniCardForecast(temperature: "15", city: City.indianapolis),
              MiniCardForecast(temperature: "9", city: City.losAngeles),
            ],
          ),
        ),  
      ],
    );
  }
}