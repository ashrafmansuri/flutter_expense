
import 'package:flutter/material.dart';

class chartBar extends StatelessWidget {
  final String _day;
  final double _sumDay;
  final double _pcTotal;


  chartBar(this._day,this._sumDay,this._pcTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              _sumDay.toString(),
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height:4),
          Container(
            height: 60,
            width: 10,
            child: Stack(children: [
              Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all( width: 1,color: Colors.grey
                
                )
              ),
                

              ),
              FractionallySizedBox(

                heightFactor: 0.5,
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                
                color: Theme.of(context).primaryColor,
                border: Border.all( width: 1,color: Colors.grey)
              ),
                

              ),
              )
            ],),
          )
        ],
      ),
    );
  }
}