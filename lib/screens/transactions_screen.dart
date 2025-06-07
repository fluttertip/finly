import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';
import '../widgets/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String _filter = 'All';

  List<String> filters = ['All', 'Income', 'Expense'];

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().transactions;

    List filteredTransactions;
    if (_filter == 'Income') {
      filteredTransactions = transactions.where((tx) => tx.isIncome).toList();
    } else if (_filter == 'Expense') {
      filteredTransactions = transactions.where((tx) => !tx.isIncome).toList();
    } else {
      filteredTransactions = transactions;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Filter buttons (dummy functionality)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: filters.map((f) {
                final isSelected = f == _filter;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(f),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        _filter = f;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final tx = filteredTransactions[index];
                  return TransactionCard(transaction: tx);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
