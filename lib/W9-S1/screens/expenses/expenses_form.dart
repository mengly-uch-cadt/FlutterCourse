import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    String valueText = _valueController.text;
    double? amount = double.tryParse(valueText);

    // 2- Validate inputs
    if (title.isEmpty) {
      showDialog(
        context: context, 
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Please enter a title'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },  
      );
      
      return;
    }

    if (amount == null || amount <= 0) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Please enter a valid positive number for amount'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
    
    if(amount > 0 ) {

      // 3- Create the expense
      // For now, using current date and a default category
      Expense expense = Expense(
          title: title,
          amount: amount,
          date: DateTime.now(),
          category: Category.food);

      // 4- Ask the parent to add the expense
      widget.onCreated(expense);
    }

    // 5- Close modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-*/.]')),
              ],
              controller: _valueController,
              maxLength: 50,
              decoration: const InputDecoration(
                prefix: Text('\$ '),
                label: Text('Amount'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: onAdd, child: const Text('Create')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
