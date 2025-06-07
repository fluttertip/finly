import 'package:flutter/material.dart';

import '../dummy_data/dummy_crypto.dart';
import '../widgets/crypto_tile.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Crypto Tracker',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: dummyCryptos.length,
                itemBuilder: (context, index) {
                  final crypto = dummyCryptos[index];
                  return CryptoTile(crypto: crypto);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
