import 'package:bom_hamburguer/models/cart_model.dart';
import 'package:bom_hamburguer/models/product_model.dart';
import 'package:bom_hamburguer/utils/assets.dart';

class HomeController {
  final CartModel cart = CartModel();

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

  void addToCart(Product product) {
    cart.add(product);
  }

  void goToCart() {}

  String get cartCount => cart.count.toString();
}
