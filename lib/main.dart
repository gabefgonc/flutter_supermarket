import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket_app/pages/cart.dart';
import 'package:supermarket_app/pages/home.dart';
import 'package:supermarket_app/state/cart_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartItems>(
        child: MaterialApp(
          routes: {
            '/': (context) => const MyHomePage(title: "Gabe's Supermarket"),
            '/cart': (context) => const CartPage()
          },
          title: "Gabe's Supermarket",
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
        ),
        create: (context) => CartItems());
  }
}
