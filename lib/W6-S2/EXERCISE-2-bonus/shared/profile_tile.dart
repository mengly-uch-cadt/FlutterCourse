import 'package:flutter/material.dart';
import 'package:practice/W6-S2/EXERCISE-2/model/profile_tile_model.dart';
import 'package:practice/W6-S2/EXERCISE-2/shared/edit_dialog.dart';
const Color mainColor = Color(0xff5E9FCD);

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.tileData,
    required this.onEdit,
  });

  final TileData tileData;
  final Function(TileData) onEdit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(tileData.icon, color: mainColor),
          title: Text(tileData.title),
          subtitle: Text(tileData.value),
          trailing: IconButton(
            onPressed: () async{
              final updatedValue = await showDialog<String>(
                context: context, 
                builder: (context) => EditDialog(initialValue: tileData.value),
              );
              if (updatedValue != null) {
                onEdit(TileData(
                  icon: tileData.icon,
                  title: tileData.title,
                  value: updatedValue,
                ));
              }
            }, 
            icon: const Icon(Icons.edit, color: mainColor),
          ),
        ),
      ),
    );
  }
}