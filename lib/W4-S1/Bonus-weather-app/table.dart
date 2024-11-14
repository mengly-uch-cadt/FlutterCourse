import 'dart:ui';
import 'package:flutter/material.dart';

class TableWeekForeCast extends StatelessWidget {
  const TableWeekForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(
                children: [
                  Center(child: Text('Mon', style: TextStyle(fontWeight: FontWeight.bold))),
                  Center(child: Text('Tue', style: TextStyle(fontWeight: FontWeight.bold))),
                  Center(child: Text('Wed', style: TextStyle(fontWeight: FontWeight.bold))),
                  Center(child: Text('Thu', style: TextStyle(fontWeight: FontWeight.bold))),
                  Center(child: Text('Fri', style: TextStyle(fontWeight: FontWeight.bold))),
                  Center(child: Text('Sat', style: TextStyle(fontWeight: FontWeight.bold))),
                  Center(child: Text('Sun', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              TableRow(
                children: [
                  Center(child: Image.asset("assets/weather-app/cloud.png")),
                  Center(child: Image.asset("assets/weather-app/light_rain_at_night.png")),
                  Center(child: Image.asset("assets/weather-app/lightning.png")),
                  Center(child: Image.asset("assets/weather-app/rain.png")),
                  Center(child: Image.asset("assets/weather-app/sleet.png")),
                  Center(child: Image.asset("assets/weather-app/snow.png")),
                  Center(child: Image.asset("assets/weather-app/wind.png")),
                ],
              ),
              const TableRow(
                children: [
                  Center(child: Text("30°C")),
                  Center(child: Text("15°C")),
                  Center(child: Text("13°C")),
                  Center(child: Text("20°C")),
                  Center(child: Text("5°C")),
                  Center(child: Text("2°C")),
                  Center(child: Text("29°C")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
