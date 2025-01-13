import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwedToYouScreen extends StatefulWidget {
  const OwedToYouScreen({super.key});

  @override
  _OwedToYouScreenState createState() => _OwedToYouScreenState();
}

class _OwedToYouScreenState extends State<OwedToYouScreen> {
  final TextEditingController _amountController = TextEditingController();

  void _saveTransaction() async {
    final prefs = await SharedPreferences.getInstance();
    double owedToYou = prefs.getDouble('owed_to_you') ?? 0;
    owedToYou += double.parse(_amountController.text);
    prefs.setDouble('owed_to_you', owedToYou);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Owed to You Transaction')),
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
