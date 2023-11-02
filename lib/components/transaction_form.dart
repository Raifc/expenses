import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }

        setState(
          () {
            _selectedDate = pickedDate;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true), // Remove 'const'
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Value (U\$)',
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No selected date'
                          : 'Selected date: ${DateFormat('d/M/y').format(_selectedDate!)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )),
                    onPressed: _showDatePicker,
                    child: const Text(
                      'Select Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ), // Remove parentheses here
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('New Transaction'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
