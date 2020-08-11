import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places_app/helpers/db_helper.dart';
import '../models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get getItems => [..._items];

  void addPlace({String title, File image}) {
    print(title);
    print(image);
    final newPlace = PlaceModel(
      id: DateTime.now().toString(),
      title: title,
      image: image,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(table: 'places', data: {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }
}
