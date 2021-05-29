import 'package:flutter/material.dart';
import 'Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteTransaction;
  TransactionList(this.transactions,this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(14, 7, 14, 7),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: FittedBox(
                    child: Text(
                      '\u{20B9}${transactions[transactions.length - 1 - index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontFamily: 'Opensans', fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              title: Text(
                transactions[transactions.length - 1 - index].title,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                DateFormat.yMMMd()
                    .format(transactions[transactions.length - 1 - index].date),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
              trailing: IconButton(icon: Icon(Icons.delete),color: Colors.red,onPressed: () {deleteTransaction(transactions[transactions.length - 1 - index].id);},),
            ),
          );
        },
        itemCount: transactions.length,
      
    );
  }
}
