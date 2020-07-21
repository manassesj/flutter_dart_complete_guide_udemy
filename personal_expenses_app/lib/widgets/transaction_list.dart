import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/transaction_item.dart';
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
                const SizedBox(height: 20.0),
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
              return TransactionItemWidget(
                transaction: transactionList[index],
                removeTransaction: removeTransaction,
              );
            },
          );
  }
}
