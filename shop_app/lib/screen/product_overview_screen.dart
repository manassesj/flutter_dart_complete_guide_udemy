import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';


class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/Product-item';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}


