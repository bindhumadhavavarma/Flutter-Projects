import 'package:expenses_app/Chart_Bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: 6-index),
        );
        var totalSum = 0.0;
        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
          ;
        }
        return {
          'day': DateFormat.E().format(weekDay),
          'amount': totalSum,
        };
      },
    );
  }

  double get weekSpending {
    return groupedTransactionsValues.fold(
      0.0,
      (sum, item) {
        return sum + item['amount'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(14),
      child: Container(
        padding: EdgeInsets.all(14),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
                child: Chart_Bar(
                    data['day'],
                    data['amount'],
                    weekSpending == 0
                        ? 0.0
                        : (data['amount'] as double) / weekSpending));
          }).toList(),
        ),
      ),
    );
  }
}
