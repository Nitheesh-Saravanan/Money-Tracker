import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabContent(String tab) {
    switch (tab) {
      case 'Credit':
        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Credit Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Source',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      case 'Debit':
        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Debit Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Reason',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      case 'Owed To You':
        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount Owed to You',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Person',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      case 'Owed':
        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount Owed',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Person',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      default:
        return Center(child: Text("Invalid Tab"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Screen"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Credit'),
            Tab(text: 'Debit'),
            Tab(text: 'Owed To You'),
            Tab(text: 'Owed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTabContent('Credit'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTabContent('Debit'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTabContent('Owed To You'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTabContent('Owed'),
          ),
        ],
      ),
    );
  }
}
