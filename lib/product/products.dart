import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/product/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((product) => product.isFavorite).toList();

  addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
