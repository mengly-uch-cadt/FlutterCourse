import 'package:flutter/material.dart';
import 'package:practice/W6-S2/EXERCISE-2/model/profile_tile_model.dart';
 
ProfileData ronanProfile = ProfileData(
  name: "Ronan",
  position: "Flutter Developer",
  avatarUrl: 'assets/w5-s2/ronan.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu.kh"),
  ]
);

ProfileData janeProfile = ProfileData(
  name: "Jane",
  position: "Full-Stack Developer",
  avatarUrl: 'assets/w5-s2/jane.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7899"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Thailand"),
    TileData(icon: Icons.email, title: "Mail", value: "jane.cute@cadt.edu.kh"),
  ]
);

ProfileData roseProfile = ProfileData(
  name: "Jane",
  position: "Frontend Developer",
  avatarUrl: 'assets/w5-s2/rose.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+855 969994954"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Korea"),
    TileData(icon: Icons.email, title: "Mail", value: "rose.cute@cadt.edu.kh"),
  ]
);

ProfileData menglyProfile = ProfileData(
  name: "Mengly",
  position: "Backend Developer",
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+855 969994954"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Thailand"),
    TileData(icon: Icons.email, title: "Mail", value: "mengly.cute@cadt.edu.kh"),
  ]
);






List<ProfileData> profiles = [
  ronanProfile,
  janeProfile,
  ronanProfile,
  menglyProfile,
];