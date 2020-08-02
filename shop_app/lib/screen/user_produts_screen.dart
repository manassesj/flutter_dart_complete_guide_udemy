import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

import '../screen/edit_product_screen.dart';

import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/User-product-screen';

  Future<void> _refleshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProductScreen.routeName),
          )
        ],
      ),
      drawer: AddDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refleshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<Products>(
            builder: (_, products, child) => ListView.builder(
              itemCount: products.getItems.length,
              itemBuilder: (_, index) => UserProductItem(
                id: products.getItems[index].id,
                title: products.getItems[index].title,
                imageUrl: products.getItems[index].imageUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
