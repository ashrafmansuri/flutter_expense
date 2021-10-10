import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: transactions.isEmpty
            ? Container(
                child: Column(
                  children: [
                    Text(
                      "Add some Data.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Container(
                        height: 400,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/waiting.png"),
                        ))
                  ],
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "\$${transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              DateFormat.yMd().format(transactions[index].date),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
