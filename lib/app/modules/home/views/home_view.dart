import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pizza_ja/app/components/pizza_ja_bottom_navigation.dart';
import 'package:pizza_ja/app/modules/home/widgets/home_header.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PizzaJaBottomNavigation(),
      body: Column(
        children: [
          HomeHeader(),
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: Text(
                  'Pizzas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    dense: true,
                    title: Text(
                      'Grande',
                      style: TextStyle(
                          fontSize: 16, color: Get.theme.primaryColor),
                    ),
                    onTap: () => controller.openMenu('Grande'),
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      'Brotinho',
                      style: TextStyle(
                          fontSize: 16, color: Get.theme.primaryColor),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
