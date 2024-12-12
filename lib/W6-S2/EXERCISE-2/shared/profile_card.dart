import 'package:flutter/material.dart';
import 'package:practice/W6-S2/EXERCISE-2/model/profile_tile_model.dart';
import 'package:practice/W6-S2/EXERCISE-2/shared/profile_tile.dart';
const Color mainColor = Color(0xff5E9FCD);

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key, required this.profileData});

  final ProfileData profileData;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  late ProfileData profileData;
  @override
  void initState() {
    super.initState();
    profileData = widget.profileData;
  } 

  void updateTile(int index, TileData updatedTile) {
    setState(() {
      profileData.tiles[index] = updatedTile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                widget.profileData.avatarUrl!), 
            ),
            const SizedBox(height: 20),
            Text(
              widget.profileData.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            Text(
              widget.profileData.position,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            for (int i = 0; i < profileData.tiles.length; i++)
              ProfileTile(
                tileData: profileData.tiles[i], 
                onEdit: (updatedTile) => updateTile(i, updatedTile)
              ),
          ],
        ),
      ),
    );
  }
}