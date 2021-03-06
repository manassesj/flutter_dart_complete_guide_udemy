import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/Product-detail';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final productId = arguments['id'];

    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                product.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              background: Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: ListTile(
                    leading: Text(
                      'Price:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text(
                      '\$${product.price}',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: ListTile(
                    leading: Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    title: Text(
                      '${product.description}',
                      style: TextStyle(color: Theme.of(context).accentColor),
                      softWrap: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 800.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
