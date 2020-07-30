import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:math';

import '../providers/orders.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;

  const OrderItemWidget({this.order});

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyy - hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView.builder(
                  itemCount: widget.order.products.length,
                  itemBuilder: (_, index) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: Text(
                              '\$${widget.order.products[index].price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            title: Text(
                              '${widget.order.products[index].title}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: 18.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            trailing: Text(
                              '${widget.order.products[index].quantity} x',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.black38,
                            indent: 5.0,
                            endIndent: 5.0,
                          ),
                        ],
                      )),
            )
        ],
      ),
    );
  }
}
