import '../models/crypto.dart';

final List<Crypto> dummyCryptos = [
  Crypto(
    name: 'Bitcoin',
    symbol: 'BTC',
    price: 27345.12,
    change24h: 1.45,
    logoUrl: 'https://cryptologos.cc/logos/bitcoin-btc-logo.png',
  ),
  Crypto(
    name: 'Ethereum',
    symbol: 'ETH',
    price: 1830.50,
    change24h: -0.73,
    logoUrl: 'https://cryptologos.cc/logos/ethereum-eth-logo.png',
  ),
  Crypto(
    name: 'Dogecoin',
    symbol: 'DOGE',
    price: 0.072,
    change24h: 3.12,
    logoUrl: 'https://cryptologos.cc/logos/dogecoin-doge-logo.png',
  ),
];
