class Transaction {
  final int transactionId;
  final int accountId;
  final String transactionDate;
  final String transactionType;
  final double amount;

  Transaction({
    required this.transactionId,
    required this.accountId,
    required this.transactionDate,
    required this.transactionType,
    required this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transaction_id'],
      accountId: json['account_id'],
      transactionDate: json['transaction_date'],
      transactionType: json['transaction_type'],
      amount: json['amount'].toDouble(),
    );
  }
}
