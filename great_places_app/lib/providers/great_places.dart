import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get getItems => [..._items];
}
