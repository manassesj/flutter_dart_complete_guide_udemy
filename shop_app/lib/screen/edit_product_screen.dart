import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {

  static const routeName = '/Edit-product-screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Column(children: <Widget>[],),
    );
  }
}