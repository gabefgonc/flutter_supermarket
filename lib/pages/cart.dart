import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket_app/state/cart_items.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartItems cartItemsProvider = Provider.of<CartItems>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Your cart'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )),
      body: ListView.builder(
        itemBuilder: (_, idx) {
          final currentCartItem = cartItemsProvider.cartItems[idx];

          return Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.grey[300], boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Expanded(
                      child: Text(currentCartItem.product.name),
                    ),
                    IconButton(
                        onPressed: () {
                          cartItemsProvider
                              .incrementCartItemAmount(currentCartItem);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.green,
                        )),
                    Text('${currentCartItem.amount}'),
                    IconButton(
                        onPressed: () {
                          cartItemsProvider
                              .decrementCartItemAmount(currentCartItem);
                        },
                        icon: const Icon(Icons.remove, color: Colors.red)),
                  ])));
        },
        itemCount: cartItemsProvider.cartItems.length,
      ),
    );
  }
}
