import 'package:flutter/material.dart';

class TotalDisplay extends StatelessWidget {
  final double totalSavings;
  final double totalSpent;
  final double savingsGoal;

  TotalDisplay({
    required this.totalSavings,
    required this.totalSpent,
    required this.savingsGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          color: Color.fromARGB(255, 76, 244, 180), // Light green background color
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'Total Saved: ', // Adjust the style here
                  ),
                  Text(
                    '\$${totalSavings.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold), // Adjust the style here
                  ),
                ],),
        ),
        SizedBox(width: 8), // Add a small space of 8 pixels
        Container(
          padding: EdgeInsets.all(8),
          color: const Color.fromARGB(255, 246, 157, 157), // Light red background color
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'Total Spent: ', // Adjust the style here
                  ),
                  Text(
                    '\$${totalSpent.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold), // Adjust the style here
                  ),
                ],),
        ),
      ],
    );
  }
}
