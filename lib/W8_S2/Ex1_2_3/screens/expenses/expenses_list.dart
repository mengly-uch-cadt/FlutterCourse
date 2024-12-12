import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onExpenseRemoved,
      required this.onExpenseRestored});

  final List<Expense> expenses;

  final Function(Expense) onExpenseRemoved;
  final Function(Expense) onExpenseRestored;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            Expense removedExpense = expenses[index];
            onExpenseRemoved(removedExpense);

            // Clear snackbar if removed multiple at the same time
            ScaffoldMessenger.of(context).clearSnackBars();

            // Show sncakbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$removedExpense was removed"),
                action: SnackBarAction(
                    label: "Undo",
                    onPressed: () => onExpenseRestored(removedExpense)),
              ),
            );
          },
          key: Key(expenses[index].id),
          child: ExpenseItem(expenses[index]),
        ),
      ),
    );
  }
}
