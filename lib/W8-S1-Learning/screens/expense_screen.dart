import 'package:flutter/material.dart';
import 'package:practice/W8-S1-Learning/models/expense.dart';
import 'package:practice/W8-S1-Learning/widgets/card.dart';



class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {

   final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: ExpenseType.WORK,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: ExpenseType.LEISURE,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Ronan-The Best Expenses App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add a new expense
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: const Text('Add Expense'),
                  content: const Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Date'),
                        keyboardType: TextInputType.datetime,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Type'),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Save the expense
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue[100],
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10,),
          MyCard(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), icon: Icons.date_range,),
        ],
      ),
        );
  }
}