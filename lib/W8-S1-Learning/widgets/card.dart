import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key, 
    required this.title, 
    required this.amount, 
    required this.date, 
    required this.icon
  });

  final String title;
  final double amount;
  final DateTime date;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
              child: ListTile(
                title: Text(title),
                subtitle: Text('Amount: \$${amount.toStringAsFixed(2)}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(icon),
                    Text('${date.day}/${date.month}/${date.year}'),
                  ],
                ),
              ),
            );
  }
}