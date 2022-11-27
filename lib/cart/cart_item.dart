import 'package:flutter/material.dart';
import 'package:shop/cart/cart_product.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text('${cartProduct.price}'),
            ),
          ),
        ),
        title: Text(cartProduct.name),
        subtitle:
            Text('Total: R\$ ${cartProduct.price * cartProduct.quantity}'),
        trailing: Text('${cartProduct.quantity}x'),
      ),
    );
  }
}
