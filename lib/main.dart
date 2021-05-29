import "dart:io";
import 'package:expenses_app/chart.dart';
import './transactionList.dart';
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './Transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{
@override
void initState(){
  WidgetsBinding.instance.addObserver(this);
  super.initState();
}
@override
void didChangeAppLifecycleState(AppLifecycleState state){
  print(state);
}
@override
void dispose(){
  WidgetsBinding.instance.removeObserver(this);
  super.dispose();
}

  List<Transaction> transactions = [
    Transaction(
      id: 'tr1',
      title: 'Chocolates',
      amount: 300,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 'tr2',
      title: 'New Shoes',
      amount: 1000,
      date: DateTime.now(),
    )
  ];
  void _addTransaction(String txtitle, double txamount, DateTime selectedDate) {
    if (txtitle.isEmpty == false && txamount > 0 && selectedDate != null) {
      final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: selectedDate,
      );
      setState(() {
        transactions.add(newTx);
        transactions.sort((a, b) {
          return a.date.compareTo(b.date);
        });
        Navigator.of(context).pop();
      });
    }
  }

  void showAddForm(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return transactions.where(
      (element) {
        return element.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showAddForm(context);
            })
      ],
      backgroundColor: Colors.purple[400],
      title: Text('Daily expense Tracker'),
    );
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: <Widget>[
          Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.21,
              child: Chart(_recentTransactions)),
          Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.79,
              child: TransactionList(transactions, _deleteTransaction)),
        ],
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showAddForm(context);
              },
              backgroundColor: Colors.purple[400],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
