import 'package:bom_hamburguer/modules/cart/cart_view.dart';
import 'package:bom_hamburguer/modules/home/home_view.dart';
import 'package:bom_hamburguer/modules/payment/payment_view.dart';
import 'package:bom_hamburguer/modules/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bom Hamburguer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4A69BB)),
        useMaterial3: true,
      ),
      routes: {
        WelcomeView.route: (context) => const WelcomeView(),
        HomeView.route: (context) => const HomeView(),
        CartView.route: (context) => const CartView(),
        PaymentView.route: (context) => const PaymentView(),
      },
    );
  }
}
