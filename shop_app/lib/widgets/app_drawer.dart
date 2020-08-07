import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/screen/order_screen.dart';
import 'package:shop_app/screen/product_overview_screen.dart';
import 'package:shop_app/screen/user_produts_screen.dart';

class AddDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          buildListTile(
            context: context,
            icon: Icons.shop,
            title: 'Shop',
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductsOverviewScreen.routeName),
          ),
          Divider(),
          buildListTile(
            context: context,
            icon: Icons.payment,
            title: 'Orders',
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrderScrren.routeName),
          ),
          Divider(),
          buildListTile(
            context: context,
            icon: Icons.add,
            title: 'Manage Products',
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routeName),
          ),
          Divider(),
          buildListTile(
            context: context,
            icon: Icons.exit_to_app,
            title: 'Logout',
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  ListTile buildListTile(
      {BuildContext context, IconData icon, String title, Function onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
