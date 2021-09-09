import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizza_ja/app/models/order_model.dart';

class HistoryPanel extends StatelessWidget {
  final OrderModel order;
  final formatNumber =
      NumberFormat.currency(name: 'R\$ ', locale: 'pt_br', decimalDigits: 2);

  HistoryPanel(
    this.order, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Pedido ${order.id}'),
      children: [
        Divider(),
        ...order.items.map(
          (e) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.item.name),
                  Text(formatNumber.format(e.item.price)),
                ],
              ),
            );
          },
        ).toList(),
        Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total:'),
              Text(
                formatNumber.format(_calculateTotalOrder()),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              )
            ],
          ),
        )
      ],
    );
  }

  double _calculateTotalOrder() => order.items
      .fold(0, (previousValue, element) => previousValue += element.item.price);
}
