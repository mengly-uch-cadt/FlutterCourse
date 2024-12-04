import 'package:intl/intl.dart';

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

  // Category is nullable because DropdownButton onChanged require nullable items
  // Category is set to food by default so it doesn't appear blank
  Category? selectedCategory = Category.food;

  void dropDownCallback(Category? category) {
    setState(() {
      selectedCategory = category;
    });
  }

  DateTime? selectedDatetime;

  Future<void> dateTimePickerCallback(BuildContext conte) async {
    final DateTime? pickedDateTime = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if (pickedDateTime != null) {
      setState(() {
        selectedDatetime = pickedDateTime;
      });
    }
  }

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
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDatetime ?? DateTime.now(),
        category: selectedCategory ?? Category.food);

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 110,
                  child: Center(
                    child: Text(
                      selectedDatetime == null
                          ? "No date selected"
                          : DateFormat('yyyy-MM-dd').format(selectedDatetime!),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () => dateTimePickerCallback(context),
                  icon: Icon(Icons.date_range))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                  value: selectedCategory,
                  alignment: Alignment.center,
                  items: Category.values.map((Category category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(
                        category.toString().split('.').last.toUpperCase(),
                      ),
                    );
                  }).toList(),
                  onChanged: dropDownCallback),
              const SizedBox(width: 20),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: onCancel, child: const Text('Cancel')),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: onAdd, child: const Text('Save Expense')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
