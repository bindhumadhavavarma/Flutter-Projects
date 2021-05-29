import 'package:flutter/material.dart';

class Chart_Bar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingFraction;
  Chart_Bar(this.label, this.spendingAmount, this.spendingFraction);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(ctx,constraints){
      return Column(
        children: [
          Container( height: constraints.maxHeight*0.15,child: FittedBox(child: Text('\u{20B9}${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color:  Color.fromRGBO(220, 220, 220, 1) ,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: spendingFraction,
                  child: Container(
                    decoration: BoxDecoration(
                      color:Colors.purple[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(height: constraints.maxHeight*0.15 ,child: Text(label)),
        ],
      );
    });
  }
}
