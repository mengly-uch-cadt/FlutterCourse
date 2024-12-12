import 'package:flutter/material.dart';
import 'package:practice/W6-S2/EXERCISE-2/data/profile_data.dart';
import 'package:practice/W6-S2/EXERCISE-2/shared/profile_card.dart';
  const Color mainColor = Color(0xff5E9FCD);

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(),
  ));
}


class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            for (var profile in profiles)
              ProfileCard(profileData: profile),
          ],
        ),
      ),
    );
  }
}
