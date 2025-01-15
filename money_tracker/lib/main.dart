import 'package:flutter/material.dart';
import 'TransactionScreen.dart';
import 'theme.dart';
import 'main_screen.dart';
import 'setup_screen.dart';
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
      theme: AppTheme.theme, // This line uses the corrected AppTheme.theme
      initialRoute: '/',
      routes: {
  '/': (context) => MainScreen(),
  '/transactions': (context) => TransactionScreen(),
  '/setup': (context) => SetupScreen(),
  '/summary': (context) => SummaryScreen(),
},

    );
  }
}
