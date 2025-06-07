import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;

  const BalanceCard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      const Color(0xFF3366FF), // Strong blue
      const Color(0xFF00CCFF), // Bright cyan
      const Color(0xFF00FF99), // Mint green
    ];

    return Container(
      width: double.infinity, // Full width of parent container
      height: 180, // Taller card for presence
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32), // More rounded corners
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.4),
            offset: const Offset(0, 12),
            blurRadius: 24,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Rs. ${balance.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          //updated now text
          const SizedBox(height: 16),
          Text(
            'Updated now',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              // fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
