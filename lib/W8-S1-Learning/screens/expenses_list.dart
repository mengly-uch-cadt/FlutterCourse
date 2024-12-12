import 'package:flutter/material.dart';
import 'package:practice/W8-S1-Learning/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     children: [
  //       ...expenses.map( (e) => Text(e.title),)
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(index.toString() + " - " + expenses[index].title),
    );
  }
}
