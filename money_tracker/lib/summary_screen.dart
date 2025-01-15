import 'package:flutter/material.dart';
import 'db_helper.dart';
import '../models/transaction_model.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  late Future<List<Transaction>> _transactions;

  @override
  void initState() {
    super.initState();
    _transactions = DBHelper().getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Summary"),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _transactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading transactions."));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No transactions found."));
          } else {
            final transactions = snapshot.data!;
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(
                    "₹${transaction.value} - ${transaction.description}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Category: ${transaction.category}, Date: ${transaction.timeStamp}",
                  ),
                  trailing: Text(transaction.type == 'C' ? "Credit" : "Debit"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
