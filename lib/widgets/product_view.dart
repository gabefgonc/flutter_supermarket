import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket_app/state/cart_items.dart';

import '../state/product.dart';

class ProductView extends StatelessWidget {
  final Product product;

  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartItems cartItems = Provider.of<CartItems>(context);

    return Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ], color: Colors.grey[300]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Text(product.name)),
              Text('${product.price}'),
              IconButton(
                  onPressed: () {
                    final cartItemOfProductIndex = cartItems.cartItems
                        .indexWhere(
                            (element) => element.product.name == product.name);
                    if (cartItemOfProductIndex != -1) {
                      final cartItemOfProduct =
                          cartItems.cartItems[cartItemOfProductIndex];
                      cartItems.incrementCartItemAmount(cartItemOfProduct);
                      return;
                    }
                    cartItems
                        .addCartItem(CartItem(product: product, amount: 1));
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ));
  }
}
