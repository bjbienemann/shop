import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cart/cart.dart';
import 'package:shop/cart/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                Chip(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: Text(
                    'R\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline6?.color,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  child: const Text('BUY'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) => CartItem(cartProduct: items[index]),
          ),
        ),
      ]),
    );
  }
}
