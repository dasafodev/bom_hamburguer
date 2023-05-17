import 'package:bom_hamburguer/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'X Burger', price: 5.0),
    Product(name: 'X Egg', price: 4.5),
    Product(name: 'X Bacon', price: 7.0),
    Product(name: 'Fries', price: 2.0),
    Product(name: 'Soft drink', price: 2.5),
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bom Hamburguer App'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              child: const Text('Add to cart'),
              onPressed: () {
                // Add product to cart logic here
              },
            ),
          );
        },
      ),
    );
  }
}
