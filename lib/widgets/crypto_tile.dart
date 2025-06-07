import 'package:flutter/material.dart';

import '../models/crypto.dart';

class CryptoTile extends StatelessWidget {
  final Crypto crypto;

  const CryptoTile({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final changeColor = crypto.change24h >= 0 ? Colors.green : Colors.red;
    final changeSign = crypto.change24h >= 0 ? '+' : '';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: Image.network(
          crypto.logoUrl,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.currency_bitcoin),
        ),
        title: Text(
          crypto.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(crypto.symbol.toUpperCase()),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${crypto.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '$changeSign${crypto.change24h.toStringAsFixed(2)}%',
              style: TextStyle(color: changeColor),
            ),
          ],
        ),
      ),
    );
  }
}
