import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.onRemove, {super.key});
  final void Function(String) onRemove;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Text('There are no transactions yet.',
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                    height: constraints.maxHeight * 0.4,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('U\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'),
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          )),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
            },
          );
  }
}
