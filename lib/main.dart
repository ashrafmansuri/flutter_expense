import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transactionList.dart';
import './models/transaction.dart';
import './widgets/transactionCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.yellow,
        fontFamily: "OpenSans"
      ),
      title: 'Expense Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      date: DateTime.parse("2021-10-09"),
    ),
  ];

  void addTxToList(String item, double price,DateTime selectedDate) {
    var tx = Transaction(
        id: DateTime.now().toString(),
        title: item,
        amount: price,
        date: selectedDate);
    setState(() {
      _transactions.add(tx);
    });
  }

 
  void _openModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return  TransactionCard(addTxToList);
        });
  }

List<Transaction> get recTx {
  return _transactions.where((element) => element.date.isAfter(DateTime.now().subtract(Duration(days:7)) )).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App',style: TextStyle(fontWeight:FontWeight.bold  ),),
        actions: [
          IconButton(
              onPressed: () => _openModal(context), icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Chart(recTx),
                
              ),
              TransactionList(transactions: _transactions)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openModal(context),
      ),
    );
  }
}
