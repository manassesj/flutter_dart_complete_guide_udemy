import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/Edit-product-screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
  }

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
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode);
                    }),
                buildInputForm(
                  context: context,
                  label: 'Desciption',
                  maxLine: 3,
                  focusNode: _descriptionFocusNode,
                  textBoardType: TextInputType.multiline,
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
    int maxLine = 1,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: label, hoverColor: Theme.of(context).primaryColor),
          textInputAction: TextInputAction.next,
          maxLines: maxLine,
          keyboardType: textBoardType,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ),
    );
  }
}
