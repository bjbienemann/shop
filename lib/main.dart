import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cart/cart.dart';
import 'package:shop/cart/cart_page.dart';
import 'package:shop/product/product_detail_page.dart';
import 'package:shop/product/product_page.dart';
import 'package:shop/product/products.dart';
import 'package:shop/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
          textTheme: theme.textTheme.copyWith(
            headline6: const TextStyle(color: Colors.white),
          ),
        ),
        home: const ProductPage(),
        routes: {
          Routes.productDetail: (_) => const ProductDetailPage(),
          Routes.cart: (_) => const CartPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
