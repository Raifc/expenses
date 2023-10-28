import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: '1', title: 'logitech mouse', value: 620.00, date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'logitech mousepad',
        value: 120.00,
        date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = (Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now()));

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
