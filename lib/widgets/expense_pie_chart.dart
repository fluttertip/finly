import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class ExpensePieChart extends StatelessWidget {
  final List<Transaction> transactions;

  const ExpensePieChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    // Aggregate expenses by category
    final expenseTransactions =
        transactions.where((tx) => !tx.isIncome).toList();

    Map<String, double> categoryTotals = {};

    for (var tx in expenseTransactions) {
      categoryTotals.update(tx.category, (value) => value + tx.amount,
          ifAbsent: () => tx.amount);
    }

    // Create PieChart sections
    final sections = <PieChartSectionData>[];
    final colors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.greenAccent,
      Colors.purpleAccent,
      Colors.yellowAccent,
    ];

    int colorIndex = 0;

    categoryTotals.forEach((category, amount) {
      final color = colors[colorIndex % colors.length];
      colorIndex++;

      sections.add(
        PieChartSectionData(
          value: amount,
          title: category,
          color: color,
          radius: 50,
          titleStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    });

    if (sections.isEmpty) {
      return const Center(
        child: Text('No expenses to show in pie chart'),
      );
    }

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: sections,
          sectionsSpace: 2,
          centerSpaceRadius: 40,
          borderData: FlBorderData(show: false),
          pieTouchData: PieTouchData(enabled: true),
        ),
      ),
    );
  }
}
