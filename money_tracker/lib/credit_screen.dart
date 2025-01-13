import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  final TextEditingController _amountController = TextEditingController();

  void _saveTransaction() async {
    final prefs = await SharedPreferences.getInstance();
    double credit = prefs.getDouble('credit') ?? 0;
    credit += double.parse(_amountController.text);
    prefs.setDouble('credit', credit);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Credit Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Enter amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTransaction,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
