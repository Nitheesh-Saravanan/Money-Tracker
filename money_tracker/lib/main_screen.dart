import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Money Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/credit'),
              child: Text('Credit'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/debit'),
              child: Text('Debit'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/owed'),
              child: Text('Owed'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/owed_to_you'),
              child: Text('Owed to You'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/summary'),
              child: Text('Summary'),
            ),
          ],
        ),
      ),
    );
  }
}
