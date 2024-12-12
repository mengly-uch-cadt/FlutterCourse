import 'package:flutter/material.dart';
import 'package:practice/W4-S1/Bonus-weather-app/city_forecast_card.dart';
import 'dart:ui';
import 'package:practice/W4-S1/Bonus-weather-app/main_card.dart';
import 'package:practice/W4-S1/Bonus-weather-app/stat/stat.dart';
import 'package:practice/W4-S1/Bonus-weather-app/table.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/weather-app/background_image.png", // Replace with your image path
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          // App content
          Column(
            children: [
              // rouded rectangle make sure that blur only the appbar 
              ClipRRect( 
                // apply filter and make it blur 
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: AppBar(
                    leading: const Icon(Icons.menu),
                    title: const Center(child: Text("Weather Forecast")),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/weather-app/us_flag.png", width: 30),
                      )
                    ],
                    backgroundColor: Colors.transparent, // Make AppBar transparent
                    elevation: 0.5, // Remove shadow
                  ),
                ),
              ),
              // Additional content here if needed
              // App Body
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const MainCard(temperature: "25", day: Day.monday, city: City.newYork, image: "light_rain_at_night",),
                    const SizedBox(height: 20,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("City Forecast", style: TextStyle(fontSize: 25),),
                        Text("See More", style: TextStyle(
                          decoration: TextDecoration.underline
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const CityForecastCard(),
                    const SizedBox(height: 20,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Week Forecast", style: TextStyle(fontSize: 25),),
                        Text("See More", style: TextStyle(
                          decoration: TextDecoration.underline
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const TableWeekForeCast(),
                    // const Spacer(), // Spacer to take up available space
                    // const SizedBox(height: 10,),
                     Align(
                      alignment: Alignment.bottomRight, // Position at the bottom right
                      child: Lottie.asset(
                        'assets/weather-app/cute-cat.json', // Replace with your Lottie file path
                        width: 200, // Set the width of the animation
                        height: 200, // Set the height of the animation
                        fit: BoxFit.fill, // Adjust how the animation fits the box
                      ),
                    ),
                    
                  ],
                ),
                
              )
            ],
          ),
        ],
      ),
    );
  }
}
