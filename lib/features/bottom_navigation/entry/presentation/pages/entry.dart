import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finwise_application/features/bottom_navigation/add/presentation/provider/transaction_provider.dart';
import 'package:intl/intl.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/records');
        break;
      case 1:
        Navigator.pushNamed(context, '/charts');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;

    // Calculate summary values
    final totalExpenses = transactions
        .where((t) => t.isExpense)
        .fold(0.0, (sum, t) => sum + t.value);
    final totalIncome = transactions
        .where((t) => !t.isExpense)
        .fold(0.0, (sum, t) => sum + t.value);
    final balance = totalIncome - totalExpenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Tracker'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (selectedDate != null && mounted) {
                final formattedDate =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected Date: $formattedDate')),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Month Display
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Month',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text(
                      DateFormat('MMM').format(DateTime.now()),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),

                // Expenses
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Expenses',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text(
                      '₹${totalExpenses.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ],
                ),

                // Income
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Income',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text(
                      '₹${totalIncome.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ],
                ),

                // Balance
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Balance',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text(
                      '₹${balance.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: transactions.isEmpty
                ? const Center(child: Text('No transactions added yet.'))
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return ListTile(
                        leading: transaction.iconPath.isNotEmpty
                            ? Image.asset(
                                transaction.iconPath,
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              )
                            : Icon(
                                Icons.account_balance_wallet,
                                color: transaction.isExpense
                                    ? Colors.red
                                    : Colors.green,
                              ),
                        title: Text(transaction.name),
                        trailing: Text(
                          '${transaction.isExpense ? '-' : '+'} ₹${transaction.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: transaction.isExpense
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF052224)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.green.shade100,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Reports',
          ),
        ],
      ),
    );
  }
}
