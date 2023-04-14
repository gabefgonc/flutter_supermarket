import 'package:flutter/material.dart';
import 'package:supermarket_app/state/product.dart';

class CartItem {
  final Product product;
  int amount;

  CartItem({required this.product, required this.amount});
}

class CartItems with ChangeNotifier {
  int _cartItemsCount = 0;
  final _cartItems = <CartItem>[];

  void addCartItem(CartItem item) {
    _cartItems.add(item);
    _cartItemsCount++;
    notifyListeners();
  }

  void removeCartItem(CartItem item) {
    _cartItems.remove(item);
    _cartItemsCount--;
    notifyListeners();
  }

  void incrementCartItemAmount(CartItem item) {
    item.amount++;
    notifyListeners();
  }

  void decrementCartItemAmount(CartItem item) {
    if (item.amount <= 1) {
      removeCartItem(item);
      return;
    }
    item.amount--;
    notifyListeners();
  }

  List<CartItem> get cartItems => _cartItems;
  int get cartItemsCount => _cartItemsCount;
}
