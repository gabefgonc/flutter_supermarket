import 'package:flutter/material.dart';
import 'package:supermarket_app/state/product.dart';
import 'package:supermarket_app/widgets/cart.dart';
import 'package:supermarket_app/widgets/product_view.dart';

const availableProducts = <Product>[
  Product(name: 'Passionfruit', price: 1.99),
  Product(name: 'Rice', price: 14.99),
  Product(name: 'Tofu', price: 14.50),
  Product(name: 'Mozzarela Cheese', price: 70.0)
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: const [CartItemsCounter(), CartButton()],
        ),
        body: Center(
            child: ListView.builder(
          itemBuilder: (_, idx) {
            final product = availableProducts[idx];

            return ProductView(product: product);
          },
          itemCount: availableProducts.length,
        )));
  }
}
