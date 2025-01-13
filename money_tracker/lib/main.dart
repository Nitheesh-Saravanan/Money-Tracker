import 'package:flutter/material.dart';
import 'setup_screen.dart';
import 'main_screen.dart';
import 'credit_screen.dart';
import 'debit_screen.dart';
import 'owed_screen.dart';
import 'owed_to_you_screen.dart';
import 'summary_screen.dart';

void main() {
  runApp(MoneyTrackerApp());
}

class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SetupScreen(),
        '/home': (context) => MainScreen(),
        '/credit': (context) => CreditScreen(),
        '/debit': (context) => DebitScreen(),
        '/owed': (context) => OwedScreen(),
        '/owed_to_you': (context) => OwedToYouScreen(),
        '/summary': (context) => SummaryScreen(),
      },
    );
  }
}
