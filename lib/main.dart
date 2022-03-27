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
          fontFamily: "OpenSans"),
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
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  void addTxToList(String item, double price, DateTime selectedDate) {
    var tx = Transaction(
        id: DateTime.now().toString(),
        title: item,
        amount: price,
        date: selectedDate);
    setState(() {
      _transactions.add(tx);
    });
  }

  void _deleteTransction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  void _openModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return TransactionCard(addTxToList);
        });
  }

  List<Transaction> get recTx {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        'Flutter App',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(onPressed: () => _openModal(context), icon: Icon(Icons.add))
      ],
    );

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Switch(
                value: _showChart,
                onChanged: (val) {
                  setState(() {
                    _showChart = val;
                  });
                },
              ),
              if (_showChart == true)
                Container(
                  height: (MediaQuery.of(context).size.height -
                          appbar.preferredSize.height -
                          MediaQuery.of(context).viewPadding.top) *
                      0.25,
                  width: double.infinity,
                  child: Chart(recTx),
                ),
              TransactionList(
                transactions: _transactions,
                deleteTx: _deleteTransction,
                heightFactor: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).viewPadding.top) *
                    0.75,
              )
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
