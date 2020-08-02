import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // var showFavoritesOnly = false;

  List<Product> get favoriteItems =>
      _items.where((element) => element.isFavorite).toList();

  List<Product> get getItems {
    // switch (showFavoritesOnly) {
    //   case true:
    //     return _items.where((element) => element.isFavorite).toList();
    //     break;
    //   default:
    return [..._items];
    // }
  }

  // void setShowFavorites() {
  //   showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void setShowAll() {
  //   showFavoritesOnly = false;
  //   notifyListeners();
  // }1

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://shopapp-7d462.firebaseio.com/products.json';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': product.isFavorite,
          },
        ),
      );
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        price: product.price,
        description: product.description,
        imageUrl: product.imageUrl,
        title: product.title,
      );
      _items.add(newProduct);
    } catch (err) {
      throw err;
    }
    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    const url = 'https://shopapp-7d462.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      
    } catch (err) {
      throw (err);
    }
  }

  void editProduct(String productId, Product product) {
    final prodIndex = _items.indexWhere((element) => element.id == productId);

    _items[prodIndex] = product;

    notifyListeners();
  }

  void deleteProduct(String productId) {
    _items.removeWhere((element) => element.id == productId);

    notifyListeners();
  }
}
