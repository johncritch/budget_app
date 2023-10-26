import 'package:flutter/material.dart';
import 'package:budget_app/widgets/savings_goal.dart';
import 'package:budget_app/widgets/total_display.dart';
import 'package:budget_app/widgets/add_transaction.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double totalSavings = 0.0;
  double totalSpent = 0.0;
  double currentSavings = 0.0;
  double savingsGoal = 1000.0; // You can set the initial goal

  void addSavings(double amount) {
    setState(() {
      totalSavings += amount;
      currentSavings = totalSavings - totalSpent;
    });

    checkGoalReached();
  }

  void addExpense(double amount) {
    setState(() {
      totalSpent += amount;
      currentSavings = totalSavings - totalSpent;
    });

    checkGoalReached();
  }

  void checkGoalReached() {
    if (currentSavings >= savingsGoal) {
      // Goal reached, you can add your handling here
      // For example, show a message or perform some action
    }
  }

  void startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return AddTransaction(addSavings, addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Budget App'),
        ),
        body: Stack(
          children: [
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SavingsGoal(savingsGoal, currentSavings),
                    TotalDisplay(totalSavings: totalSavings, totalSpent: totalSpent, savingsGoal: savingsGoal),
                    SizedBox(height: 100), // Add a small space of 8 pixels

                    
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.fromLTRB(0,0,20,50),
              child: ElevatedButton(
                onPressed: () {
                  startAddTransaction(context);
                },
                child: Text('Add Transaction'),
              ),
            )
          ],
        )
      ),
    );
  }
}
