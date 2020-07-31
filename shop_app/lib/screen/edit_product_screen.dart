import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/Edit-product-screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                buildInputForm(
                    context: context,
                    label: 'Title',
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    }),
                buildInputForm(
                  context: context,
                  label: 'Price',
                  textBoardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildInputForm({
    BuildContext context,
    String label,
    TextInputType textBoardType = TextInputType.text,
    FocusNode focusNode,
    Function onFieldSubmitted,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: label, hoverColor: Theme.of(context).primaryColor),
          textInputAction: TextInputAction.next,
          keyboardType: textBoardType,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ),
    );
  }
}
