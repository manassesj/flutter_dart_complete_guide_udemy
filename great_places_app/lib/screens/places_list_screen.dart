import 'package:flutter/material.dart';

import '../screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  static const routeName = '/place-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(AddPlaceScreen.routeName),
          ),
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
