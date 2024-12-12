import 'package:flutter/material.dart';
import 'package:practice/W9_S2/MyPractice/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) {
          return Container(
            // color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                Icons.rectangle, 
                color: dummyGroceryItems[index].category.color
              ),
              title: Text(dummyGroceryItems[index].name),
              subtitle: Text(dummyGroceryItems[index].quantity.toString()),
              
              isThreeLine: true,
              trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
              },
              ),
              contentPadding: const EdgeInsets.all(8.0),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NewItem(),
              ))
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
