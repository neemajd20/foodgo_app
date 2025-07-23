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

  int get itemCount => _items.length;
}
