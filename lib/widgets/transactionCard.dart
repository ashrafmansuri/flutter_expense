import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
  final Function _addTx;

  TransactionCard(this._addTx);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final _titleTextHandler = TextEditingController();

  final _amountTextHandler = TextEditingController();

  void _sumbitData()
  {

    if(_titleTextHandler.text.isEmpty || double.parse(_amountTextHandler.text) <=0)
    {
      return;
    }
         widget._addTx(_titleTextHandler.text,
                      double.parse(_amountTextHandler.text));

                      Navigator.of(context).pop();
  }

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
               onSubmitted: (_) {  _sumbitData();
                }
            ),
            TextField(
                controller: _amountTextHandler,
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                onSubmitted: (val) {  _sumbitData();
                }
                ),
            TextButton(
                onPressed: _sumbitData,
                child: Text("Enter New"),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.yellow))),
          ],
        ),
      ),
    );
  }
}
