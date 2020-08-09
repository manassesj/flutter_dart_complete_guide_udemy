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

class _OrderItemWidgetState extends State<OrderItemWidget>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  AnimationController _controller;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _slideAnimation = Tween<Offset>(begin: Offset(0, -0.5), end: Offset(0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height:
          isExpanded ? min(widget.order.products.length * 20.0 + 200, 300) : 95,
      child: Card(
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
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Container(
                height: isExpanded
                    ? min(widget.order.products.length * 20.0 + 95, 180)
                    : 0,
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
                          style:
                              Theme.of(context).textTheme.headline6.copyWith(
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
