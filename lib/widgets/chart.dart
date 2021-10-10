import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/chartbar.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {

final List<Transaction> recTx;

Chart(this.recTx);

List<Map<String,Object>> get tx {

  return List.generate(7, (index) {
    final weekDay = DateTime.now().subtract(Duration(days:index));
    double sumDay = 0.0;
    for(int i = 0 ; i  < recTx.length ;  i++)
    {
     if(recTx[i].date.day == weekDay.day && recTx[i].date.month == weekDay.month && recTx[i].date.year == weekDay.year) 
     {
       
      sumDay = sumDay + recTx[i].amount;
     }
    }
    return {'day' : DateFormat.E().format(weekDay) ,'sumDay':sumDay};
  });
}
  @override
  Widget build(BuildContext context) {
    print(tx);
    return Container(
      child:Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:tx.map((e) {
                    return chartBar(e['day'], e['sumDay'], e['sumDay']);
                  }).toList(),),
                ),),
      ),
      
            
      );
    
  }
}