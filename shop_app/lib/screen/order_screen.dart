import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/order_item.dart';

import '../providers/orders.dart';

class OrderScrren extends StatelessWidget {
  static const routeName = '/Order-screen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).getOrders;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (_, index) => OrderItemWidget(order: orders[index]),
      ),
    );
  }
}
