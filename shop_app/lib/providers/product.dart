import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool olValue) {
    isFavorite = olValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final url = 'https://shopapp-7d462.firebaseio.com/products/$id.json';
    final oldValue = isFavorite;
    isFavorite = !isFavorite;

    notifyListeners();

    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {'isFavorite': !isFavorite},
        ),
      );

      if (response.statusCode >= 400) {
        _setFavValue(oldValue);
      }
    } catch (e) {
      _setFavValue(oldValue);
      throw e;
    }
  }
}
