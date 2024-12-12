import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';
 
class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  late List<GroceryItem> groceryItemsData;
  @override
  void initState() {
    super.initState();
    groceryItemsData = dummyGroceryItems;
  }
  
void _addItem() async {
  final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem != null) {
      setState(() {
        groceryItemsData.add(newItem);
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));
    final groceryItems = groceryItemsData;
    if (groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => GroceryTile(groceryItems[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed:  _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(this.groceryItem, {super.key});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
      ),
    );
  }
}