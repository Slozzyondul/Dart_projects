import 'package:flutter/material.dart';
import '../models/get_all_accounts.dart';

class AccountsTab extends StatelessWidget {
  final Future<List<GetAllAccounts>> accounts;

  const AccountsTab({required this.accounts, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetAllAccounts>>(
      future: accounts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No accounts found.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var account = snapshot.data![index];
              return ListTile(
                title: Text('Account ID: ${account.accountId}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date Created: ${account.dateCreated}'),
                    Text('Date Updated: ${account.dateUpdated}'),
                    Text('Lender Id: ${account.lenderId}'),
                    Text('Borrower Id: ${account.borrowerId}'),
                    Text('Total: ${account.total}'),
                    Text('Available: ${account.available}'),
                    Text('Owed: ${account.owed}'),
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
