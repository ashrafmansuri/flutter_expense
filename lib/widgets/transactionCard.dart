
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final _titleTextHandler = TextEditingController();
  final _amountTextHandler = TextEditingController(); 
  final Function _addTx;

  TransactionCard(this._addTx);
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleTextHandler,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _amountTextHandler,
              decoration: InputDecoration(labelText: "Price"),
            ),
            TextButton(
                onPressed: (_addTx(_titleTextHandler.text,  double.parse(_amountTextHandler.text))) ,
                child: Text("Enter New"),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.yellow))),
          ],
        ),
      ),
    );
  }
}
