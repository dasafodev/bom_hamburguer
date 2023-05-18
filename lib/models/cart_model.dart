import 'package:bom_hamburguer/models/product_model.dart';

class CartModel {
  final Map<String, Product> _products = {};

  void add(Product product) {
    if (_products.containsKey(product.name)) {
      throw Exception(
          'Each order cannot contain more than one ${product.name}');
    }
    _products[product.name] = product;
  }

  double get total {
    double sum =
        _products.values.fold(0, (total, product) => total + product.price);
    return sum - _calculateDiscount(sum);
  }

  int get count => _products.length;

  double _calculateDiscount(double total) {
    if (_isSandwichInCart() &&
        _products.containsKey('Fries') &&
        _products.containsKey('Soft drink')) {
      return total * 0.20; // 20% discount
    }
    if (_isSandwichInCart() && _products.containsKey('Soft drink')) {
      return total * 0.15; // 15% discount
    }
    if (_isSandwichInCart() && _products.containsKey('Fries')) {
      return total * 0.10; // 10% discount
    }
    return 0;
  }

  bool _isSandwichInCart() {
    return _products.containsKey('X Burger') ||
        _products.containsKey('X Egg') ||
        _products.containsKey('X Bacon');
  }
}
