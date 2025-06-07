import '../models/transaction.dart';

final List<Transaction> dummyTransactions = [
  Transaction(
    id: 't1',
    amount: 150.00,
    isIncome: true,
    category: 'Salary',
    note: 'Part-time work',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't2',
    amount: 40.75,
    isIncome: false,
    category: 'Food',
    note: 'Dinner with friends',
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Transaction(
    id: 't3',
    amount: 120.00,
    isIncome: false,
    category: 'Transport',
    note: 'Taxi fare',
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
];
