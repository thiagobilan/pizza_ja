import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_ja/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PizzaJaBottomNavigation extends StatelessWidget {
  const PizzaJaBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Pedidos'),
        BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: 'Sair')
      ],
      onTap: (index) async {
        switch (index) {
          case 0:
            Get.offAllNamed(Routes.HOME);
            break;
          case 1:
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
