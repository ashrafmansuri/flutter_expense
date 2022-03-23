import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final Function _addTx;

  TransactionCard(this._addTx);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final _titleTextHandler = TextEditingController();
  final _amountTextHandler = TextEditingController();
  DateTime _selectedDate;

  void _sumbitData() {
    if (_titleTextHandler.text.isEmpty ||
        double.parse(_amountTextHandler.text) <= 0 ||
        _selectedDate == null) {
      return;
    }
    widget._addTx(_titleTextHandler.text, double.parse(_amountTextHandler.text),
        _selectedDate);

    Navigator.of(context).pop();
  }

  void _datePickShow() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((returnedDate) {
      if (returnedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = returnedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewPadding.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                  controller: _titleTextHandler,
                  decoration: InputDecoration(labelText: "Title"),
                  onSubmitted: (_) {
                    _sumbitData();
                  }),
              TextField(
                  controller: _amountTextHandler,
                  decoration: InputDecoration(labelText: "Price"),
                  keyboardType: TextInputType.number,
                  onSubmitted: (val) {
                    _sumbitData();
                  }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(_selectedDate == null
                            ? "No date selected 😂"
                            : DateFormat.yMd().format(_selectedDate))),
                    TextButton(
                        onPressed: _datePickShow, child: Text("Select Date"))
                  ],
                ),
              ),
              TextButton(
                  onPressed: _sumbitData,
                  child: Text("Enter New"),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.yellow))),
            ],
          ),
        ),
      ),
    );
  }
}
