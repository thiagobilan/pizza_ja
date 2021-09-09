import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pizza_ja/app/components/pizza_ja_button.dart';
import 'package:pizza_ja/app/modules/shopping_card/controllers/shopping_card_controller.dart';
import 'package:pizza_ja/app/modules/shopping_card/widgets/shopping_cart_items.dart';

class ShoppingCardView extends GetView<ShoppingCardController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Sacola',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                'Cancelar',
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constructor) {
            return Container(
              height: constructor.maxHeight,
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Nome'),
                        subtitle: Text(controller.userName),
                      ),
                      Divider(),
                      ShoppingCartItems(),
                      Divider(),
                      ListTile(
                        title: Text('Endereço de Entrega'),
                        subtitle: Obx(() => Text('Rua: ${controller.address}')),
                        trailing: TextButton(
                          child: Text(
                            'alterar',
                            style: TextStyle(color: Get.theme.primaryColor),
                          ),
                          onPressed: () => controller.changeAddress(),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Forma de Pagamento'),
                        subtitle: Obx(() => Text(controller.paymentType)),
                        trailing: TextButton(
                          child: Text(
                            'alterar',
                            style: TextStyle(color: Get.theme.primaryColor),
                          ),
                          onPressed: () => controller.changePaymentType(),
                        ),
                      ),
                      Divider(),
                      Expanded(child: SizedBox.shrink()),
                      PizzaJaButton(
                        label: 'Finalizar Pedido',
                        width: Get.size.width * .9,
                        height: 50,
                        labelSize: 18,
                        labelColor: Colors.white,
                        buttonColor: Get.theme.primaryColor,
                        onPressed: () => controller.checkout(),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
