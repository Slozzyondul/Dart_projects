import 'package:flutter/material.dart';
import 'package:prototype2/models/get_all_accounts.dart';
import 'package:prototype2/models/get_all_transactions.dart';
import 'package:prototype2/models/get_all_users.dart';
import 'package:prototype2/methods/fetch_all_accounts.dart';
import 'package:prototype2/methods/fetch_all_users.dart';
import 'package:prototype2/methods/fetch_all_transactions.dart';
import 'package:prototype2/screens/add_users_to_db.dart';
import 'package:prototype2/classes/accounts_tab.dart';
import 'package:prototype2/classes/transactions_tab.dart';
import 'package:prototype2/classes/users_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _deviceHeight, _deviceWidth;
  late Future<List<User>> _users;
  late Future<List<Transaction>> _transactions;
  late Future<List<GetAllAccounts>> _getAllAcounts;

  @override
  void initState() {
    super.initState();
    _users = fetchUsers();
    _transactions = fetchTransactions();
    _getAllAcounts = fetchAllAcounts();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            toolbarHeight: _deviceHeight * 0.085,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Users'),
                Tab(text: 'Transactions'),
                Tab(text: 'Accounts'),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  // Navigate to AddUserScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddUserScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: TabBarView(
            children: [
              UsersTab(users: _users),
              TransactionsTab(transactions: _transactions),
              AccountsTab(accounts: _getAllAcounts),
            ],
          ),
        ),
      ),
    );
  }
}
