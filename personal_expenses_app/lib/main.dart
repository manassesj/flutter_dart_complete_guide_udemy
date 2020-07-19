import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import 'models/transactionModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expensers',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactionList = new List<Transaction>();

  void _addNewTransaction(String title, double amount, DateTime pickedDate) {
    final newTransaction = new Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: pickedDate,
    );

    setState(() {
      _transactionList.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(
          onPress: _addNewTransaction,
        );
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _transactionList.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactionList.removeWhere((element) => element.id == id);
    });
  }

  bool _showChart = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Personal Expensers',
            ),
            trailing: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              'Personal Expensers',
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () => _startAddNewTransaction(context),
              )
            ],
          );

    final txList = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(
        transactionList: _transactionList,
        removeTransaction: _deleteTransaction,
      ),
    );

    final pagBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (isLanscape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Show chart'),
              Switch.adaptive(
                value: _showChart,
                onChanged: (value) {
                  setState(() {
                    _showChart = value;
                  });
                },
              ),
            ],
          ),
        if (!isLanscape)
          Container(
            height: (mediaQuery.size.height -
                    appBar.preferredSize.height -
                    mediaQuery.padding.top) *
                0.3,
            child: ChartWidget(
              recentTransaction: _recentTransactions,
            ),
          ),
        if (!isLanscape) txList,
        if (isLanscape)
          _showChart
              ? Container(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.7,
                  child: ChartWidget(
                    recentTransaction: _recentTransactions,
                  ),
                )
              : txList
      ],
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: pagBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pagBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddNewTransaction(context),
                    child: Icon(Icons.add),
                  ),
          );
  }
}
