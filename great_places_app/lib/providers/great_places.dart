import 'dart:io';

import 'package:flutter/foundation.dart';
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
  }
}