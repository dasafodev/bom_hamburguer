import 'dart:async';

import 'package:bom_hamburguer/modules/home/home_view.dart';
import 'package:bom_hamburguer/modules/welcome/welcome_view.dart';
import 'package:bom_hamburguer/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentView extends StatefulWidget {
  static const route = '/payment';
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  bool _showSuccessMessage = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _showSuccessMessage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: AnimatedOpacity(
          opacity: _showSuccessMessage ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeView.route,
                ModalRoute.withName(WelcomeView.route),
                arguments: true,
              );
            },
            child: const Text('Make another order'),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.payment,
            repeat: false,
          ),
          AnimatedOpacity(
            opacity: _showSuccessMessage ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: const Text(
              'Order successfully created',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
