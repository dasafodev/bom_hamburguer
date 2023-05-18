import 'package:bom_hamburguer/modules/home/home_view.dart';
import 'package:bom_hamburguer/utils/assets.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  static const route = '/';

  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeView.route);
          },
          child: const Text('Place order'),
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bom Hamburguer',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
      ),
    );
  }
}
