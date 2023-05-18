import 'package:bom_hamburguer/models/product_model.dart';

class CartModel {
  final Map<String, Product> _products = {};
  Product? _sandwich;

  List<Product> get products =>
      [_sandwich].where((product) => product != null).cast<Product>().toList()
        ..addAll(_products.values);

  void empty() {
    _products.clear();
    _sandwich = null;
  }

  void add(Product product) {
    if (_isSandwich(product)) {
      if (_sandwich != null) {
        throw Exception('You can only have one sandwich in the cart');
      } else {
        _sandwich = product;
      }
    } else if (_products.containsKey(product.name)) {
      throw Exception(
          'Each order cannot contain more than one ${product.name}');
    } else {
      _products[product.name] = product;
    }
  }

  void remove(Product product) {
    if (_isSandwich(product)) {
      _sandwich = null;
    } else {
      _products.remove(product.name);
    }
  }

  double get subtotal {
    return (products).fold(0, (total, product) => total + product.price);
  }

  double get discount => _calculateDiscount(subtotal);

  double get total => subtotal - discount;

  int get count => products.length;

  double _calculateDiscount(double total) {
    if (_sandwich != null &&
        _products.containsKey('Fries') &&
        _products.containsKey('Soft drink')) {
      return total * 0.20; // 20% discount
    }
    if (_sandwich != null && _products.containsKey('Soft drink')) {
      return total * 0.15; // 15% discount
    }
    if (_sandwich != null && _products.containsKey('Fries')) {
      return total * 0.10; // 10% discount
    }
    return 0;
  }

  bool _isSandwich(Product product) {
    return product.name == 'X Burger' ||
        product.name == 'X Egg' ||
        product.name == 'X Bacon';
  }
}
