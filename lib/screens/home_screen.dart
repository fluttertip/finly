import 'package:finly/widgets/balance_card.dart';
import 'package:finly/widgets/expense_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';
import '../widgets/stat_tile.dart';
import '../widgets/transaction_card.dart';
import 'add_transaction_screen.dart';
import 'transactions_screen.dart';
import 'crypto_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    DashboardTab(),
    const TransactionsScreen(),
    const CryptoScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddTransactionScreen(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: 'Crypto',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().transactions;

    double totalIncome = transactions
        .where((tx) => tx.isIncome)
        .fold(0, (sum, tx) => sum + tx.amount);
    double totalExpense = transactions
        .where((tx) => !tx.isIncome)
        .fold(0, (sum, tx) => sum + tx.amount);
    double balance = totalIncome - totalExpense;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Total Balance',
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   '\Rs.  ${balance.toStringAsFixed(2)}',
            //   style: Theme.of(
            //     context,
            //   ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            // ),
            BalanceCard(balance: balance),
            const SizedBox(height: 24),

            // Stats tiles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatTile(
                  title: 'Income',
                  amount: totalIncome,
                  icon: Icons.arrow_downward,
                  color: Colors.green,
                ),
                StatTile(
                  title: 'Expense',
                  amount: totalExpense,
                  icon: Icons.arrow_upward,
                  color: Colors.red,
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text(
              'Expenses by Category',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),

            ExpensePieChart(transactions: transactions),

            Text(
              'Recent Transactions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: transactions.length > 5 ? 5 : transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
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
