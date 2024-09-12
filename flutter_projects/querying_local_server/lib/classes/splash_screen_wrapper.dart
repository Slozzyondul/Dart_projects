import 'package:flutter/material.dart';
import 'package:prototype2/methods/fetch_all_accounts.dart';
import 'package:prototype2/methods/fetch_all_transactions.dart';
import 'package:prototype2/methods/fetch_all_users.dart';
import 'package:prototype2/models/get_all_accounts.dart';
import 'package:prototype2/models/get_all_transactions.dart';
import 'package:prototype2/models/get_all_users.dart';
import 'package:prototype2/screens/home_screen.dart';
import 'package:prototype2/screens/splash_screen.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  bool _isLoading = true;
  late Future<List<User>> _users;
  late Future<List<Transaction>> _transactions;
  late Future<List<GetAllAccounts>> _getAllAcounts;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _users = fetchUsers();
    _transactions = fetchTransactions();
    _getAllAcounts = fetchAllAcounts();

    // Simulate some loading time
    await Future.delayed(const Duration(seconds: 5));

    // Wait for the data to finish loading
    await Future.wait([_users, _transactions, _getAllAcounts]);

    // After loading data, update the state to switch to the HomeScreen
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? const SplashScreen() : const HomeScreen();
  }
}
