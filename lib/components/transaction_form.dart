import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'title')),
            TextField(
                controller: valueController,
                decoration: InputDecoration(
                  labelText: 'Value (U\$)',
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    child: Text('New Transaction'),
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.purple))
              ],
            )
          ],
        ),
      ),
    );
  }
}
