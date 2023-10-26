import 'package:flutter/material.dart';

class SavingsGoal extends StatelessWidget {
  final double goal;
  final double currentSavings;

  SavingsGoal(this.goal, this.currentSavings);

  @override
  Widget build(BuildContext context) {
    double progress = currentSavings / goal;
    if (progress > 1.0) {
      progress = 1.0; // Cap progress at 100% if it exceeds the goal
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'Goal: ',
                    style: TextStyle(fontSize: 24), // Adjust the style here
                  ),
                  Text(
                    '\$${goal.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Adjust the style here
                  ),
                ],),
          SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Background circle
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.grey[200]!),
                  ),
                ),
                // Filled gauge
                Container(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    value: progress, // Progress toward the goal
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    backgroundColor: Colors.grey[200],
                    strokeWidth: 20,
                  ),
                ),
                // Text showing the goal and progress
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'Savings:',
                    style: TextStyle(fontSize: 20), // Adjust the style here
                  ),
                  Text(
                    '\$${currentSavings.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Adjust the style here
                  ),
                ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
