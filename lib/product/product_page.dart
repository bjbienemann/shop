import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cart/cart.dart';
import 'package:shop/cart/cart_badge.dart';
import 'package:shop/product/product.dart';
import 'package:shop/product/product_item.dart';
import 'package:shop/product/products.dart';
import 'package:shop/routes.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shop'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Just favorites'),
                value: FilterOptions.favorite,
              ),
              const PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.all,
              ),
            ],
            onSelected: (FilterOptions value) {
              setState(() {
                _showFavoriteOnly = (value == FilterOptions.favorite);
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.cart);
              },
            ),
            builder: (_, cart, child) => CartBadge(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: ProductGridView(showFavoriteOnly: _showFavoriteOnly),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
    required this.showFavoriteOnly,
  }) : super(key: key);

  final bool showFavoriteOnly;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Products>(context);
    final List<Product> products =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (_, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (3 / 2),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

enum FilterOptions {
  favorite,
  all,
}
