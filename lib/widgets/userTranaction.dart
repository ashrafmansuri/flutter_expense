
import 'package:flutter/material.dart';
import './transactionCard.dart';
import './transactionList.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void addTxToList(String item,double price)
  {
    var tx = Transaction(id: DateTime.now().toString(), title: item, amount: price, date: DateTime.now());
    setState(() {
            _transactions.add(tx);
        });
  
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionCard(addTxToList),
        TransactionList(
          transactions: _transactions,
        )
      ],
    );
  }
}
