import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place-screen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String _title;
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _onSaved() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    if (_pickedImage == null) {
      print('ola');
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Please take a image'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    _formKey.currentState.save();

    Provider.of<GreatPlacesProvider>(context, listen: false)
        .addPlace(title: _title, image: _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildTextFormFild(
                        label: 'Title',
                        onSave: (String value) {
                          _title = value;
                        }),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
            RaisedButton.icon(
              onPressed: _onSaved,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              color: Theme.of(context).accentColor,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }

  Card buildTextFormFild({String label, Function onSave}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
          ),
          onSaved: onSave,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please type a title';
            }
            return null;
          },
        ),
      ),
    );
  }
}
