import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function(double) addSavings;
  final Function(double) addExpense;

  AddTransaction(this.addSavings, this.addExpense);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _amountController = TextEditingController();
  bool isSavings = true; // To track whether it's a savings or an expense

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text) ?? 0.0;

    if (enteredAmount <= 0) {
      return; // Do not add if the entered amount is not valid
    }

    if (isSavings) {
      widget.addSavings(enteredAmount);
    } else {
      widget.addExpense(enteredAmount);
    }

    // Clear the text field
    _amountController.clear();

    // Close the bottom sheet
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SwitchListTile(
              title: isSavings ? Text('Transaction: New Saving') : Text('Transaction: New Expense'),
              value: isSavings,
              onChanged: (newValue) {
                setState(() {
                  isSavings = newValue;
                });
              },
              activeColor: isSavings ? Colors.green : Colors.red, // Set active color based on selection
              secondary: isSavings ? Icon(Icons.attach_money, color: Colors.green) : Icon(Icons.money_off, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
