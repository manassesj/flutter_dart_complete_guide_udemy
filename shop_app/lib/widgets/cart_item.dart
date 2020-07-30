import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  const CartItemWidget({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final onDismiss = Provider.of<Cart>(context, listen: false).removeCartItem;

    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        onDismiss(id);
      },
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you wht to remove the item from the cart?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('yes'),
              ),
            ],
          ),
        );
      },
      background: Container(
        padding: const EdgeInsets.only(right: 20.0),
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete),
        alignment: Alignment.center,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: FittedBox(child: Text('\$ ${price.toStringAsFixed(2)}')),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
