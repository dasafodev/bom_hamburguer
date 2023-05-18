import 'package:bom_hamburguer/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.products,
    required this.onAddToCart,
  });
  final List<Product> products;
  final Function(Product) onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (innerContext) => ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.only(top: 12),
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(product.image),
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              child: const Text('Add to cart'),
              onPressed: () {
                try {
                  onAddToCart(product);
                } catch (e) {
                  ScaffoldMessenger.of(innerContext).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
