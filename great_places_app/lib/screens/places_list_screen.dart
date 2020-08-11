import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';

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
                .pushNamed(AddPlaceScreen.routeName),
          ),
        ],
      ),
      body: Consumer<GreatPlacesProvider>(
        child: const Center(
          child: Text('Got no places yest'),
        ),
        builder: (_, greatPlaces, child) => greatPlaces.getItems.length <= 0
            ? child
            : ListView.builder(
                itemCount: greatPlaces.getItems.length,
                itemBuilder: (_, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(greatPlaces.getItems[index].image),
                  ),
                  title: Text(greatPlaces.getItems[index].title),
                  trailing: IconButton(
                    icon: Icon(Icons.details),
                    onPressed: () {},
                  ),
                ),
              ),
      ),
    );
  }
}