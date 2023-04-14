import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/cart_items.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        icon: const Icon(Icons.shopping_cart));
  }
}

class CartItemsCounter extends StatelessWidget {
  const CartItemsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<CartItems>(context).cartItemsCount;
    return Container(
        width: 25,
        height: 25,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(
          child: Text('$count',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
