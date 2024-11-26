
import 'package:uuid/uuid.dart';

enum ExpenseType { FOOD, TRAVEL, LEISURE, WORK }

class Expense {
  static const Uuid uuid = Uuid();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }): id = Expense.uuid.v4();
}