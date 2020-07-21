import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactionModel.dart';

class TransactionItemWidget extends StatelessWidget {
  final Transaction transaction;
  final Function removeTransaction;

  const TransactionItemWidget({
    Key key,
    @required this.transaction,
    @required this.removeTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      elevation: 3.0,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMd().add_jm().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                onPressed: () {
                  removeTransaction(transaction.id);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  removeTransaction(transaction.id);
                },
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
