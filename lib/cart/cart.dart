import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shop/cart/cart_product.dart';
import 'package:shop/product/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartProduct> _items = {};

  Map<String, CartProduct> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (value) => CartProduct(
          id: value.id,
          productId: value.productId,
          name: value.name,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartProduct(
          id: Random().nextDouble().toString(),
          productId: product.id,
          name: product.name,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  clear() {
    _items = {};
    notifyListeners();
  }
}
