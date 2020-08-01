import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/Edit-product-screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _editProduct = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      return;
    }
    _formKey.currentState.save();
    Provider.of<Products>(context, listen: false).addProduct(_editProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: _saveForm)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                buildInputForm(
                    context: context,
                    label: 'Title',
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                    onSaved: (value) {
                      _editProduct = Product(
                        title: value,
                        price: _editProduct.price,
                        imageUrl: _editProduct.imageUrl,
                        description: _editProduct.description,
                        id: null,
                      );
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Please Provide a value';
                      }
                    }),
                buildInputForm(
                  context: context,
                  label: 'Price',
                  textBoardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (String value) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (value) {
                    _editProduct = Product(
                      title: _editProduct.title,
                      price: double.parse(value),
                      imageUrl: _editProduct.imageUrl,
                      description: _editProduct.description,
                      id: null,
                    );
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Please enter a Price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number.';
                    }
                    if (double.parse(value) <= 0) {
                      return 'Please a number greater than zero';
                    }
                    return null;
                  },
                ),
                buildInputForm(
                  context: context,
                  label: 'Desciption',
                  maxLine: 3,
                  focusNode: _descriptionFocusNode,
                  textBoardType: TextInputType.multiline,
                  onSaved: (value) {
                    _editProduct = Product(
                      title: _editProduct.title,
                      price: _editProduct.price,
                      description: value,
                      imageUrl: _editProduct.imageUrl,
                      id: null,
                    );
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Please enter a description';
                    }
                    if (value.toString().length < 10) {
                      return 'Should be 10 characters long';
                    }
                    return null;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Card(
                      child: Container(
                        alignment: Alignment.center,
                        width: 100.0,
                        height: 100.0,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: _imageUrlController.text.isEmpty
                            ? Text('Enter a Url')
                            : FittedBox(
                                child: Image.network(
                                  _imageUrlController.text,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      child: buildInputForm(
                        context: context,
                        label: 'Image Url',
                        textBoardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        onFieldSubmitted: (_) => _saveForm(),
                        onSaved: (value) {
                          _editProduct = Product(
                            title: _editProduct.title,
                            price: _editProduct.price,
                            imageUrl: value,
                            description: _editProduct.description,
                            id: null,
                          );
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please enter a imageUrl';
                          }
                          if (!value.toString().startsWith('http') &&
                              !value.toString().startsWith('https')) {
                            return 'Please enter a valid imageUrl';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )
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
    TextInputAction textInputAction = TextInputAction.next,
    TextEditingController controller,
    Function onSaved,
    Function validator,
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
          textInputAction: textInputAction,
          maxLines: maxLine,
          keyboardType: textBoardType,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          onSaved: onSaved,
          validator: validator,
        ),
      ),
    );
  }
}
