import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwedScreen extends StatefulWidget {
  const OwedScreen({super.key});

  @override
  _OwedScreenState createState() => _OwedScreenState();
}

class _OwedScreenState extends State<OwedScreen> {
  final TextEditingController _amountController = TextEditingController();

  void _saveTransaction() async {
    final prefs = await SharedPreferences.getInstance();
    double owed = prefs.getDouble('owed') ?? 0;
    owed += double.parse(_amountController.text);
    prefs.setDouble('owed', owed);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Owed Transaction')),
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
