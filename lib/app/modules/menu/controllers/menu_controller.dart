import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizza_ja/app/models/menu_item_model.dart';
import 'package:pizza_ja/app/models/menu_model.dart';
import 'package:pizza_ja/app/modules/shopping_card/controllers/shopping_card_controller.dart';
import 'package:pizza_ja/app/modules/shopping_card/views/shopping_card_view.dart';

import 'package:pizza_ja/app/repository/menu_repository.dart';
import 'package:pizza_ja/app/repository/order_repository.dart';

class MenuController extends GetxController {
  final MenuRepository _repository;
  final _flavorSelected = <MenuItemModel>[].obs;
  final _menu = <MenuModel>[].obs;

  List<MenuModel> get menu => _menu;
  List<MenuItemModel> get flavorSelected => _flavorSelected;
  double get totalValue => _flavorSelected.fold(
      0, (previousValue, element) => previousValue += element.price);

  MenuController(
    this._repository,
  );

  void addItem(MenuItemModel item) {
    if (_flavorSelected.contains(item)) {
      _flavorSelected.remove(item);
    } else {
      _flavorSelected.add(item);
    }
  }

  Future<void> goToShoppingCard() async {
    Get.put(OrderRepository(Get.find()));
    Get.put(ShoppingCardController(Get.find(), _flavorSelected));
    await showBarModalBottomSheet(
      context: Get.context!,
      isDismissible: false,
      builder: (context) {
        return ShoppingCardView();
      },
    );
    Get.delete<OrderRepository>();
    Get.delete<ShoppingCardController>();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    final menuData = await _repository.findAll();
    _menu.assignAll(menuData!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
