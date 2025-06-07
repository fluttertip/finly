class Transaction {
  final String id;
  final double amount;
  final bool isIncome;
  final String category;
  final String note;
  final DateTime date;

  Transaction({
    required this.id,
    required this.amount,
    required this.isIncome,
    required this.category,
    required this.note,
    required this.date,
  });
}
