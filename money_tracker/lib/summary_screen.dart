import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  double income = 0;
  double credit = 0;
  double debit = 0;
  double owed = 0;
  double owedToYou = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      income = prefs.getDouble('income') ?? 0;
      credit = prefs.getDouble('credit') ?? 0;
      debit = prefs.getDouble('debit') ?? 0;
      owed = prefs.getDouble('owed') ?? 0;
      owedToYou = prefs.getDouble('owed_to_you') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Income: \$${income.toStringAsFixed(2)}'),
            Text('Credit: \$${credit.toStringAsFixed(2)}'),
            Text('Debit: \$${debit.toStringAsFixed(2)}'),
            Text('Owed: \$${owed.toStringAsFixed(2)}'),
            Text('Owed to You: \$${owedToYou.toStringAsFixed(2)}'),
            Text('Remaining: \$${(income + credit - debit).toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
