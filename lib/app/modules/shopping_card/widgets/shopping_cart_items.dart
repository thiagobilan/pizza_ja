import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pizza_ja/app/modules/shopping_card/controllers/shopping_card_controller.dart';
import 'package:pizza_ja/app/modules/shopping_card/widgets/shopping_cart_item.dart';

class ShoppingCartItems extends GetView<ShoppingCardController> {
  final currencyFormat = NumberFormat.currency(
    locale: 'pt_br',
    decimalDigits: 2,
    symbol: 'R\$',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Pedido',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ...controller.flavorSelected
            .map((element) => ShoppingCartItem(element))
            .toList(),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text(currencyFormat.format(controller.totalValue)),
            ],
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
