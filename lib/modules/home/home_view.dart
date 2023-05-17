import 'package:bom_hamburguer/models/product_model.dart';
import 'package:bom_hamburguer/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final List<Product> sandwiches = [
    Product(
      name: 'X Burger',
      price: 5.0,
      image: Assets.burguer,
    ),
    Product(name: 'X Egg', price: 4.5, image: Assets.egg),
    Product(name: 'X Bacon', price: 7.0, image: Assets.bacon),
  ];

  final List<Product> extras = [
    Product(name: 'Fries', price: 2.0, image: Assets.fries),
    Product(name: 'Soft drink', price: 2.5, image: Assets.drink),
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bom Hamburguer App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sandwiches'),
              Tab(text: 'Extras'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              children: [
                const Align(
                  child: Icon(
                    Icons.shopping_cart,
                  ),
                ),
                Positioned(
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          onPressed: () {
            // Go to cart logic here
          },
        ),
        body: TabBarView(
          children: [
            buildProductList(sandwiches),
            buildProductList(extras),
          ],
        ),
      ),
    );
  }

  Widget buildProductList(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.only(top: 12),
      itemBuilder: (context, index) {
        return ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(products[index].image)),
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
    );
  }
}
