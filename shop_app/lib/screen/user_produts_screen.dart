import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/User-product-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      drawer: AddDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Products>(
          builder: (_, products, child) => ListView.builder(
            itemCount: products.getItems.length,
            itemBuilder: (_, index) => UserProductItem(
              title: products.getItems[index].title,
              imageUrl: products.getItems[index].imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
