import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pizza_ja/app/modules/menu/controllers/menu_controller.dart';

class MenuBuyButtom extends GetView<MenuController> {
  const MenuBuyButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formater =
        NumberFormat.currency(locale: 'pt_br', decimalDigits: 2, symbol: 'R\$');
    return Container(
      color: Colors.grey[300],
      child: Row(
        children: [
          SizedBox(
            width: Get.size.width * .5,
            child: Obx(
              () => Text(
                'Total ${formater.format(controller.totalValue)}',
                style: TextStyle(
                  fontSize: 18,
                  color: controller.flavorSelected.isEmpty
                      ? Colors.grey
                      : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: controller.flavorSelected.isEmpty
                        ? Colors.grey
                        : Colors.red),
                onPressed: controller.flavorSelected.isEmpty ? null : () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Fechar Pedido',
                    style: TextStyle(color: Colors.white),
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
