import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

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
                decoration: InputDecoration(labelText: 'Title')),
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
                    onPressed: () {
                      final title = titleController.text;
                      final value =
                          double.tryParse(valueController.text) ?? 0.0;
                      onSubmit(title, value);
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.purple))
              ],
            )
          ],
        ),
      ),
    );
  }
}
