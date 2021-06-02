import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/models/cartitem.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';

class CartService extends ChangeNotifier {

  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  bool isSubCategoryAddedToCart(SubCategory cat) {
    return _items.length > 0 ? _items.any(
      (CartItem item) => item.category.name == cat.name) : false;
  }

  double getShoppingCartTotalPrice() {
    double mainTotal = 0;
    _items.forEach((CartItem item) {
      SubCategory itemSubCategory = (item.category as SubCategory);
      double total = itemSubCategory.amount * itemSubCategory.price;
      mainTotal += total;
    });
    return mainTotal;
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  SubCategory getCategoryFromCart(SubCategory cat) {
    SubCategory subCat = cat;
    if (_items.length > 0 && _items.any((CartItem item) => item.category.name == cat.name)) {
      CartItem cartItem = _items.firstWhere((CartItem item) => item.category.name == cat.name);

      if (cartItem != null) {
        subCat = cartItem.category;
      }
    }

    return subCat;
  }
}