import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {super.key});
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transactions.map((tr) {
        return Card(
            child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.purple,
                width: 2,
              )),
              padding: EdgeInsets.all(10),
              child: Text("U\$  ${tr.value.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  )),
            ),
            Column(
              children: [
                Text(tr.title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(DateFormat('d MMM y').format(tr.date),
                    style: TextStyle(color: Colors.grey[600]))
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
