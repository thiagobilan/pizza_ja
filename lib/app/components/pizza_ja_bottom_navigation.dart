import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pizza_ja/app/routes/app_pages.dart';

class PizzaJaBottomNavigation extends StatelessWidget {
  final int _currentIndex;

  const PizzaJaBottomNavigation(
    this._currentIndex, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Pedidos'),
        BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: 'Sair')
      ],
      onTap: (index) async {
        switch (index) {
          case 0:
            if (_currentIndex != 0) Get.offAllNamed(Routes.HOME);
            break;
          case 1:
            if (_currentIndex != 1) Get.offAllNamed(Routes.ORDERS_PAGE);
            break;
          case 2:
            final sp = await SharedPreferences.getInstance();
            sp.clear();
            Get.offAllNamed(Routes.SPLASH);
            break;
          default:
        }
      },
    );
  }
}
