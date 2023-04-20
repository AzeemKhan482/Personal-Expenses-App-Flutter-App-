import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
final List<Transaction> transactions;
TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      child: transactions.isEmpty? Column(children: [
       Text('No Transaction added yet !!', style: Theme.of(context).textTheme.headline6,
       ),SizedBox(height: 20,), Container(
        height: 500,
          child: Image.asset('assets/images/flutter.jpg',fit: BoxFit.cover,),)
      ],):ListView.builder(
        itemBuilder: (ctx, index){
          return Card(child: Row(children: [
            Container(
              child: Text(
                '\$${transactions[index].amount?.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).primaryColor),),
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor,width: 2),),
              padding: EdgeInsets.all(10),

            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transactions[index].tittle.toString(),style: Theme.of(context).textTheme.headline6),
                Text(
                  DateFormat.yMMMd().format(transactions[index].date as DateTime),

                  style: TextStyle(color: Colors.grey),),
              ],)
          ],)
          );
        },
        itemCount: transactions.length,

        ),
      );

  }
}
