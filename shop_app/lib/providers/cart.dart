import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get getItems => {..._items};

  int get getItemCount {
    var countItems = 0;
    _items.forEach((key, value) {
      countItems += value.quantity;
    });
    return countItems;
  }

  double get getTotalAmount {
    double total = 0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem({String productId, String title, double price}) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (oldCartItem) => CartItem(
          id: oldCartItem.id,
          price: oldCartItem.price,
          title: oldCartItem.title,
          quantity: oldCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  void removeCartItem(String id) {
    _items.removeWhere((key, value) => value.id == id);
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }
}
