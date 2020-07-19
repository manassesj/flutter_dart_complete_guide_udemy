import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../models/transactionModel.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function removeTransaction;

  TransactionList({this.transactionList, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20.0),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactionList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
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
                          '\$${transactionList[index].amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactionList[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMd()
                        .add_jm()
                        .format(transactionList[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeTransaction(transactionList[index].id);
                    },
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
          );
  }
}
