import 'package:flutter/material.dart';
import 'package:finwise_application/features/bottom_navigation/add/data/transactions.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  // Add a new transaction (Expense or Income)
  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();  // Notify listeners about the update
  }
}
