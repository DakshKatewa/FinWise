import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finwise_application/features/bottom_navigation/add/presentation/provider/transaction_provider.dart'; // Import provider
import 'package:finwise_application/features/bottom_navigation/add/data/transactions.dart';
import 'package:intl/intl.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  int _selectedIndex = 0; // Keep track of the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the respective page using named routesjhkjhkjhkj
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
    // Fetch the list of transactions from the provider
    final transactions = Provider.of<TransactionProvider>(context).transactions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Page'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today), // Calendar icon
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(), // Default date
                firstDate: DateTime(2000), // Earliest date
                lastDate: DateTime(2100), // Latest date
              );

              if (selectedDate != null && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected Date: $selectedDate')),
                );
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
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
      body: transactions.isEmpty
          ? const Center(child: Text('No transactions added yet.'))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  leading: transaction.iconPath.isNotEmpty
                      ? Image.asset(
                          transaction
                              .iconPath, // Load the icon from the asset path
                          width: 24, // Set the width of the icon
                          height: 24, // Set the height of the icon
                          fit: BoxFit.contain, // Make sure the icon scales well
                        )
                      : Icon(
                          Icons
                              .account_balance_wallet, // Default icon if no iconPath
                          color:
                              transaction.isExpense ? Colors.red : Colors.green,
                        ),
                  title: Text(transaction.name),
                  trailing: Text(
                    '${transaction.isExpense ? '-' : '+'} ₹${transaction.value.toStringAsFixed(2)}', // Use ₹ instead of $
                    style: TextStyle(
                      color: transaction.isExpense ? Colors.red : Colors.green,
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Trigger navigation on tap
        backgroundColor: Colors.green.shade100,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.folder), // Records icon
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), // Charts icon
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle), // Add (+) icon
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description), // Reports icon
            label: 'Reports',
          ),
        ],
      ),
    );
  }
}
