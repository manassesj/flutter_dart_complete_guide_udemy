import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/http_exception.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  final String authToken;
  final String userId;

  Products(this.authToken, this._items, this.userId);

  List<Product> get favoriteItems =>
      _items.where((element) => element.isFavorite).toList();

  List<Product> get getItems {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://shopapp-7d462.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'createId': userId,
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

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString = filterByUser ?'&orderBy="createId"&equalTo="$userId"' : '';
    var url =
        'https://shopapp-7d462.firebaseio.com/products.json?auth=$authToken$filterString';
    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData == null) {
        return;
      }

      url =
          'https://shopapp-7d462.firebaseio.com/userFavorites/$userId.json?auth=$authToken';

      final favoriteResponse = await http.get(url);

      final favoriteData = json.decode(favoriteResponse.body);

      final List<Product> loadedProducts = [];
      responseData.forEach(
        (productId, productData) {
          loadedProducts.insert(
            0,
            Product(
              id: productId,
              title: productData['title'],
              description: productData['description'],
              imageUrl: productData['imageUrl'],
              isFavorite: favoriteData == null
                  ? false
                  : favoriteData[productId] ?? false,
              price: productData['price'],
            ),
          );
        },
      );
      _items = loadedProducts;
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<void> editProduct(String productId, Product product) async {
    final prodIndex = _items.indexWhere((element) => element.id == productId);
    final url =
        'https://shopapp-7d462.firebaseio.com/products/$productId.json?auth=$authToken';
    try {
      await http.patch(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
          },
        ),
      );
      _items[prodIndex] = product;
    } catch (err) {
      //...
    }

    notifyListeners();
  }

  Future<void> deleteProduct(String productId) async {
    final productIndex =
        _items.indexWhere((element) => element.id == productId);
    final url =
        'https://shopapp-7d462.firebaseio.com/products/$productId.json?auth=$authToken';

    var existingProduct = _items[productIndex];
    _items.removeAt(productIndex);

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _items.insert(productIndex, existingProduct);
      throw HttpException('Could Not delete Product');
    }
    existingProduct = null;
  }

  notifyListeners();
}
