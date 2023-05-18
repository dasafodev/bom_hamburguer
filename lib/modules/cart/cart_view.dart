import 'package:bom_hamburguer/models/cart_model.dart';
import 'package:bom_hamburguer/modules/payment/payment_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  static const route = '/cart';
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final _formKey = GlobalKey<FormState>();

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final CartModel cart =
        ModalRoute.of(context)!.settings.arguments as CartModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: cart.count,
            itemBuilder: (context, index) {
              final product = cart.products[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(product.image),
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        cart.remove(product);
                      });
                    },
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onInverseSurface),
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Your name',
                        ),
                        validator: _validateInput,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total: \$${cart.subtotal.toStringAsFixed(2)}',
                              ),
                              Text(
                                  'Discount: \$${cart.discount.toStringAsFixed(2)}'),
                              Text(
                                'To Pay: \$${cart.total.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                  context,
                                  PaymentView.route,
                                );
                                cart.empty();
                              }
                            },
                            child: const Text('Checkout'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
