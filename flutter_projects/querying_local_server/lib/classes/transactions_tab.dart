import 'package:flutter/material.dart';
import '../models/get_all_transactions.dart';

class TransactionsTab extends StatelessWidget {
  final Future<List<Transaction>> transactions;

  const TransactionsTab({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: transactions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No transactions found.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var transaction = snapshot.data![index];
              return ListTile(
                title: Text('Transaction ID: ${transaction.transactionId}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account ID: ${transaction.accountId}'),
                    Text('Date: ${transaction.transactionDate}'),
                    Text('Type: ${transaction.transactionType}'),
                    Text('Amount: ${transaction.amount}'),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
