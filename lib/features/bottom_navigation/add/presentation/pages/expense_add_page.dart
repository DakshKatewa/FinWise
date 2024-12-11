import 'package:finwise_application/core/constants/transaction_constants.dart'; // Import the new constants file
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finwise_application/features/bottom_navigation/add/presentation/provider/transaction_provider.dart';
import 'package:finwise_application/features/bottom_navigation/add/data/transactions.dart';

class ExpenseAddPage extends StatelessWidget {
  const ExpenseAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Transaction'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Expenses'),
              Tab(text: 'Income'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGrid(context, TransactionConstants.expenseimages, true),
            _buildGrid(context, TransactionConstants.incomeimages, false),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, List<Map<String, String>> iconData,
      bool isExpense) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: iconData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center both the icon and text
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showInputDialog(
                    context,
                    isExpense,
                    iconData[index]['name']!,
                    iconData[index]['path']!,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Image.asset(
                  iconData[index]['path']!,
                  fit: BoxFit.contain,
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(height: 4), // Spacer between the icon and text
              Text(
                iconData[index]['name']!, // Display the name under the icon
                style: const TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 12, // Adjust the font size as needed
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showInputDialog(
      BuildContext context, bool isExpense, String iconName, String iconPath) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter amount for $iconName'),
          content: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter amount',
            ),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final double amount = double.tryParse(_controller.text) ?? 0.0;
                if (amount > 0) {
                  final transaction = Transaction(
                      name: iconName,
                      value: amount,
                      isExpense: isExpense,
                      iconPath: iconPath);
                  Provider.of<TransactionProvider>(context, listen: false)
                      .addTransaction(transaction);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
