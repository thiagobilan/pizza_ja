import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_ja/app/modules/menu/widgets/menu_buy_buttom.dart';
import 'package:pizza_ja/app/modules/menu/widgets/menu_content.dart';

import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  final String pizzaSize;
  MenuView({
    required this.pizzaSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.black,
            )),
        title: Text(
          pizzaSize,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.grey[200],
              child: Obx(
                () => Text(
                  'Total de pizzas selecionadas: ${controller.flavorSelected.length}',
                  style: Get.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: MenuContent(),
            ),
            Container(
              child: MenuBuyButtom(),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
