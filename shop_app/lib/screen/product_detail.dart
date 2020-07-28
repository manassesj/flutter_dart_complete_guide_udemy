import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/Product-detail';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final productTitle = arguments['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(productTitle),
      ),
    );
  }
}
