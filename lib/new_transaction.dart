import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtransaction;
  NewTransaction(this.addtransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = new TextEditingController();
  DateTime selectedDate1;
  final amountController = new TextEditingController();
  void dateinput() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      setState(() {
        if (selectedDate != null) {
          selectedDate1 = selectedDate;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: MediaQuery.of(context).viewInsets.bottom+10,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  selectedDate1 == null
                      ? Text("No date Choosen!")
                      : Text(DateFormat.yMMMd().format(selectedDate1)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: OutlinedButton(
                      onPressed: () {
                        dateinput();
                      },
                      child: Text('Choose Date'),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.addtransaction(titleController.text,
                    double.parse(amountController.text), selectedDate1);
              },
              child: Text('Add Transaction'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple[400]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
