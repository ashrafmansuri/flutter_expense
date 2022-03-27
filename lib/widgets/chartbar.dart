import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _day;
  final double _sumDay;
  final double _pcTotal;

  ChartBar(this._day, this._sumDay, this._pcTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              "\$${_sumDay.toStringAsFixed(2)}",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 80,
            width: 15,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.black)),
                ),
                FractionallySizedBox(
                  heightFactor: _pcTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                        border: Border.all(width: 1, color: Colors.grey)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              _day.toString(),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
