import 'package:flutter/material.dart';
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
            route: ProductsOverviewScreen.routeName,
          ),
          Divider(),
          buildListTile(
            context: context,
            icon: Icons.payment,
            title: 'Orders',
            route: OrderScrren.routeName,
          ),
          Divider(),
          buildListTile(
            context: context,
            icon: Icons.add,
            title: 'Manage Products',
            route: UserProductScreen.routeName,
          ),
          Divider(),
        ],
      ),
    );
  }

  ListTile buildListTile(
      {BuildContext context, IconData icon, String title, String route}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.of(context).pushReplacementNamed(route),
    );
  }
}
