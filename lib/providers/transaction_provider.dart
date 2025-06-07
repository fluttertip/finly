import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../dummy_data/dummy_transactions.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = dummyTransactions;

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void clearTransactions() {
    _transactions.clear();
    notifyListeners();
  }
}
