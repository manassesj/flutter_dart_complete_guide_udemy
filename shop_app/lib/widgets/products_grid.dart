import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_item.dart';


class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsData  = Provider.of<Products>(context);
    final products = productsData.getItems;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (_, index) {
        return ProductItem(
          id: products[index].id,
          title: products[index].title,
          imageUrl: products[index].imageUrl,
        );
      },
    );
  }
}