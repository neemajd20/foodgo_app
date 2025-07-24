import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String imagePath;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  
  void addToCart({
    required String id,
    required String title,
    required String imagePath,
    required double price,
  }) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity += 1;
    } else {
      _items[id] = CartItem(
        id: id,
        title: title,
        imagePath: imagePath,
        price: price,
      );
    }
    notifyListeners();
  }

  
  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

  
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  
  int get totalItems {
    int total = 0;
    _items.forEach((key, item) {
      total += item.quantity;
    });
    return total;
  }

  
  double get totalPrice {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void increaseQuantity(String id) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity += 1;
      notifyListeners();
    }
  }

  
  void decreaseQuantity(String id) {
    if (_items.containsKey(id)) {
      if (_items[id]!.quantity > 1) {
        _items[id]!.quantity -= 1;
      } else {
        _items.remove(id);
      }
      notifyListeners();
    }
  }


  int get itemCount => _items.length;
}
