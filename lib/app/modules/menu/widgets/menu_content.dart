import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_ja/app/models/menu_item_model.dart';
import 'package:pizza_ja/app/models/menu_model.dart';
import 'package:pizza_ja/app/modules/menu/controllers/menu_controller.dart';
import 'package:pizza_ja/app/modules/menu/widgets/menu_group.dart';

class MenuContent extends GetView<MenuController> {
  const MenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Obx(
        () => ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            return MenuGroup(controller.menu[index]);
          },
        ),
      ),
    );
  }
}
