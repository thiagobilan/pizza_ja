import 'dart:convert';

import 'package:pizza_ja/app/models/menu_item_model.dart';

class OrderItemModel {
  int id;
  MenuItemModel item;
  OrderItemModel({
    required this.id,
    required this.item,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item.toMap(),
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      id: map['id'],
      item: MenuItemModel.fromMap(map['item']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromJson(String source) =>
      OrderItemModel.fromMap(json.decode(source));
}
