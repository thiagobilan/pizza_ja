import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizza_ja/app/models/menu_item_model.dart';

class ShoppingCartItem extends StatelessWidget {
  final MenuItemModel item;
  final currencyFormat = NumberFormat.currency(
    locale: 'pt_br',
    decimalDigits: 2,
    symbol: 'R\$',
  );

  ShoppingCartItem(
    this.item, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name),
          Text(currencyFormat.format(item.price)),
        ],
      ),
    );
  }
}
