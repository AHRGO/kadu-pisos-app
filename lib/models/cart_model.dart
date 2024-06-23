import 'package:flutter/material.dart';

import './item_model.dart';
import './piso_model.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Piso piso) {
    for (var item in _items) {
      if (item.item.name == piso.name) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(Item(item: piso, quantity: 1));
    notifyListeners();
  }

  void removeItem(Item item) {
    if(item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}