import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:pizza_ja/app/models/menu_model.dart';
import 'package:pizza_ja/app/modules/menu/controllers/menu_controller.dart';

class MenuGroup extends GetView<MenuController> {
  final formater =
      NumberFormat.currency(locale: 'pt_br', decimalDigits: 2, symbol: 'R\$');
  final MenuModel _menu;
  MenuGroup(
    this._menu,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Text(
            _menu.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _menu.items?.length,
          itemBuilder: (context, index) {
            final item = _menu.items![index];

            return ListTile(
              title: Text(
                item.name,
                style: TextStyle(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              subtitle: Text(
                formater.format(item.price),
                style: TextStyle(fontSize: 13),
              ),
              trailing: Obx(
                () {
                  final itemSelected = controller.flavorSelected.contains(item);
                  return IconButton(
                    icon: Icon(
                      itemSelected
                          ? Icons.remove_circle_rounded
                          : Icons.add_circle_rounded,
                      color: Get.theme.primaryColor,
                      size: 20,
                    ),
                    onPressed: () => controller.addItem(item),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
