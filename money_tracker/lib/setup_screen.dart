import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final TextEditingController _incomeController = TextEditingController();

  void _saveIncome() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('income', double.parse(_incomeController.text));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setup Income')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _incomeController,
              decoration: InputDecoration(labelText: 'Enter your income'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveIncome,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
