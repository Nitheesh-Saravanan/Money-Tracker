import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DebitScreen extends StatefulWidget {
  const DebitScreen({super.key});

  @override
  _DebitScreenState createState() => _DebitScreenState();
}

class _DebitScreenState extends State<DebitScreen> {
  final TextEditingController _amountController = TextEditingController();

  void _saveTransaction() async {
    final prefs = await SharedPreferences.getInstance();
    double debit = prefs.getDouble('debit') ?? 0;
    debit += double.parse(_amountController.text);
    prefs.setDouble('debit', debit);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Debit Transaction')),
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
