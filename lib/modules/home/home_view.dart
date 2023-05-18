import 'package:bom_hamburguer/models/product_model.dart';
import 'package:bom_hamburguer/modules/cart/cart_view.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'product_list.dart';

class HomeView extends StatefulWidget {
  static const route = '/home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = HomeController();

  @override
  void didChangeDependencies() {
    final bool? emptyCart = ModalRoute.of(context)?.settings.arguments as bool?;
    if (emptyCart == true) {
      controller.cart.empty();
    }
    super.didChangeDependencies();
  }

  void addToCart(Product product) {
    setState(() {
      controller.addToCart(product);
    });
  }

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
                    child: Text(
                      controller.cartCount,
                      style: const TextStyle(
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
            Navigator.pushNamed(
              context,
              CartView.route,
              arguments: controller.cart,
            );
          },
        ),
        body: TabBarView(
          children: [
            ProductList(
              products: controller.sandwiches,
              onAddToCart: addToCart,
            ),
            ProductList(
              products: controller.extras,
              onAddToCart: addToCart,
            ),
          ],
        ),
      ),
    );
  }
}
